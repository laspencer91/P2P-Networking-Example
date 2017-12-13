/// @description Delayed Initialize

UPDATE_BUFFER = net_CreateBuffer(pType.CLIENT_STATE_UPDATE, 
						         owner.myClientId,
								 x, buffer_s16,
								 y, buffer_s16,
								 image_angle, buffer_u16);
								 