import vulkan as vk

# 1 Enable tis Valkin 1.3 Dynamic rendering feature struct
dynamic_render_features = vk . VkPhysicalDeviceDynamicRenderFeatures(
   sType=vk.VKSTRUCTURE_TYPE_PHYSICAL_DYNAMIC_REDERING_FEATURES,
   pNext=None,
   dynamicRender=vk.VK_TURE # skips legacy RenderPass requirements
)