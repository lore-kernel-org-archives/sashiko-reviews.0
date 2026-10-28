Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186358;
	b=z/0wwvjM/SFLQEfO79EjOsvJ4oAkHeg5nce3tZc01l3dCBa3vujdm23f23AQGBKCSlbr
	 lcoM8x9SnuZgBRYUw190Hqw09pZPEZizIVHvNj/WrjQtgXLWIzcdWDG+xetCOsu3o9gTQ
	 GZFpiSLEai4GScEtDHxe38AqHgSMcsUaISsUpAHKkhuUF8xlAiVi/h9ZtibvhAHr+dG0J
	 Vd7FdZynJjuROl0iHDfFn9iSvIj0ln5nOCR+/mhdpXUoVOpba0O0nhM4KjmpUGcArE+qI
	 S1JPVdbqAmniiAWRAgIPEl4FpiAS71w0tbnFgsH4matdZrqv1WoRnIaT+B64RBfBtJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186358;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=acx3ERfn6sywUlgPAMqQsMVKffZoJLkimvPtRFxAyY0=;
	b=gGn/HJyT8HR1cVlCzek7p5A+exyqiuJtIJSGrAReGLToG5ctLKhtc8v++Sdd4yf+KhvD
	 +GQ+cpJcTyxg8Tp5EcFo4/6nAfdmaQgRYFOXh/Err2fMFRs3cOWr1Whnt2WfDtnMiocuW
	 fK9sfD5ChPXaii5SeAoRNG9VpF1H7lVdWcVuP/JA6bhGRzLDzUK6lU2FzH79y4uNGlnaA
	 3splKvqLfM3ZDaSWm9a4UfhYv8NbxYtumAkom3a4yd81LtbBlikF45XJIiOPa3l2EA71a
	 3v0bq6iOQPxAYmCrjuqS1kYOr+O96gX7r8keZPvwmLudGi+FmjFz9vR0ualkFwSa3eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S0uvPGjZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC8660A3811;
	Wed, 28 Oct 2026 11:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S0uvPGjZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0249C1F01345;
	Wed, 28 Oct 2026 11:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793186358;
	bh=acx3ERfn6sywUlgPAMqQsMVKffZoJLkimvPtRFxAyY0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=S0uvPGjZBd1qbjEyLNDQhv2g9X69ElTHwmdO9lsDdUslyaE92X9tgNltg8Vg9K5HU
	 LlQBZ3NmzDMkkQWlm33wn5+1tk27tCXJ+jvtXelWZ1kHC46mrqluBz+U4gtTdIHWUZ
	 8JfQYCDJfVDoHtBk+/wroVq5WGSs40UcUyh5yqGiZ3wbT3V1sYYjekF8wB52wExyr9
	 oGxpRph1mEe0Ge4Hc5ic3Hp2QAbW/VXO3MwO7E1qNHGh5YCNOZQwHiOXEbJrKMz8jA
	 wHMWLSfEJjzbJwXRFyz6T+I+CYlLalbpLD8JIdL5XnDH3j8SuJpxS3me/sMg3C2i0C
	 UKGIkEgve+y/g==
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6] phy: qualcomm: qmp-combo: Add USB4/TBT3
 configuration data for Hamoa
From: Manivannan Sadhasivam <mani@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-phy@lists.infradead.org, 
 robh@kernel.org, vkoul@kernel.org, olteanv@gmail.com, 
 neil.armstrong@linaro.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260928114013.B44CC1F00899@smtp.kernel.org>
References: <20260928-topic-usb4phy-v6-1-815a73b063ef@oss.qualcomm.com>
 <20260928114013.B44CC1F00899@smtp.kernel.org>
Date: Wed, 28 Oct 2026 16:49:11 +0530
Message-Id: <179318635124.5872.6065890957918101932.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=361; i=mani@kernel.org;
 h=from:subject:message-id; bh=acx3ERfn6sywUlgPAMqQsMVKffZoJLkimvPtRFxAyY0=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq4doyBxSvvpreSwuZ4fkmgC5LGi+wMraug+92R
 1zlDSl8ppSJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauHaMgAKCRBVnxHm/pHO
 9ZC+B/wMIfSERj3XbNehdfoYIqak3PSd5Dyc68G0UNfaltsJQvwPxLu7B5rUlsNpgN8f/kKZrtZ
 qxM8448qNoojyMWkUcs0CZbQbUfmn/wqNNoYVPYI/Meu5JMWSITpP2aC3JvoO4RG7vuyCmNdgv7
 0kfbrFMVDfQcW9XIZFSvJAxC44qSx+zOPwksomzMvlMVzdezHwzl8X4qEL/9wKEtTMOylvwVlv+
 ggQdJauBySgxAxjUrn0EGy9pCFIqoCobHWGB6IYBpeLYR+bQr4XWFunI3+Bnpz4ZVEG+sEuWTOu
 kQFGRbpNSR+hZI4IIaAshNmeVC39Gfuuex9E2lrUCfjLReHR
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-09-28 11:40 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] phy: qualcomm: incorrectly named TX macro for RX UCDR FASTLOCK registers
> - [Low] phy: qualcomm: typo LPFS instead of LFPS in PCS USB4 macro

Can you please take a look at these nits?

- Mani

