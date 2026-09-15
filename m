Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B3B36E498
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 10:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469886; cv=none; b=jtD2o9ZpmG3bxadGTf4oZEco455qArayk3Q1Pyze6PSuwE00L+qmkbwpwBs3vu9pSCIf9gP1EpyWmIchBHSKLzVCWrh0Cevuox6IKvBNarsajQHK3jHw9fPe3Bs4ntsjcnjgyqKmQ/BzY7nh7URbeV7jkSLFPIQJHqYeDTuz8Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469886; c=relaxed/simple;
	bh=9Dqd/3myOp0uOV2PXIihuLG0UGPpoBxXIqC+sUB4vUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U3xlzcoqw33Aj8t38LSGoRM4e790z5bnkhE2lIZy3/M05AY3f24LQAgGaekrwm3LlJOSAdTO7yL7ri8MGjzH6UxdqFw/neRjdWtEQwv2qENpBS8IxGPRBZ24d5tAFjyMERaNCte2zE6yIsYPx7AI52mpZO24DuC3kxpQRHW8PBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=k3lw390q; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="k3lw390q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789469883;
	bh=9Dqd/3myOp0uOV2PXIihuLG0UGPpoBxXIqC+sUB4vUo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k3lw390qlA8dh62t0WimAyIDtFI+jdt/LuX0VsOiqXfFSzkodpqr5G6Lht5+HKuth
	 kp4pPc2kLGnP/RyfOuXs9x1ztpAb9jZV+gYXA/RAQZssrkxbJAfklb8DHi3mwXpdr8
	 MT9qLvu6TCoNqfqq+vkMf4WS241psWZpIwQcCKolVdzl8d+TAV+4N1CTqr9zayD8o0
	 +dE3/2RN+T7Ih0lXe2klHkhnCmUGPwJAbp2Z38LHuA/gw9Wn9v8YTkNUSuNEbYxEns
	 ydYVn8OPrw95llTMqwr2dtMYYXgAUYaMja+mkrYzPRiL8sWNklx6p5BrmgOiOXTfbH
	 +vQkQ6VzrEYCg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1077B17E089A;
	Tue, 15 Sep 2026 12:58:03 +0200 (CEST)
Message-ID: <0255ffba-ce22-4065-a94e-dc2e0e635b62@collabora.com>
Date: Tue, 15 Sep 2026 12:58:02 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: Document MT8196 MediaTek
 PCI-Express Gen4 S-PHY
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org,
 devicetree@vger.kernel.org, olteanv@gmail.com, vkoul@kernel.org,
 linux-phy@lists.infradead.org, robh@kernel.org
References: <20260915101022.23852-1-angelogioacchino.delregno@collabora.com>
 <20260915101022.23852-2-angelogioacchino.delregno@collabora.com>
 <20260915101828.D552F1F000FF@smtp.kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260915101828.D552F1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/26 12:18, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dt-bindings: strict array prevents 1-lane S-PHY nvmem configuration
> --
> 
> commit c6841c20d82c1db99761e33c189c44960b8b5284
> Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> dt-bindings: phy: Document MT8196 MediaTek PCI-Express Gen4 S-PHY
> 
> This commit adds device tree bindings for the MediaTek PCI-Express Gen4 S-PHY
> found in newer SoCs like the MT8196. The PHY supports link rates up to 16.0
> GT/s per lane, up to two lanes, and both Root Complex and End Point modes.
> 
>> diff --git a/Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.yaml
>> new file mode 100644
>> index 0000000000000..3fd1bfbc3822f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.yaml
> [ ... ]
>> +  nvmem-cell-names:
>> +    items:
>> +      - const: int-r
> [ ... ]
>> +      - const: tx-lanes-pmos
>> +      - const: tx-lanes-nmos
>> +      - const: tx-ln0-rswn
>> +      - const: tx-ln1-rswn
>> +      - const: cal-version
> 
> [Severity: Medium]
> Does this rigid array structure prevent valid 1-lane S-PHY configurations from
> passing schema validation?
> 
> Defining a device tree node for a 1-lane PHY typically involves omitting the
> unused "tx-ln1-rswn" eFuse cell. However, because the items array enforces
> strict positional constraints, omitting that entry shifts the index of the
> global "cal-version" cell. This will cause dt_binding_check to fail for
> legitimate 1-lane configurations.
> 
> Could the schema be adjusted to allow the second lane's eFuse cell to be
> optional without breaking the expected position of "cal-version"? Otherwise,
> it seems DT authors are forced to either drop calibration entirely or include
> irrelevant dummy eFuse references.

In the single lane case, one lane is usually used for USB3, but the calibrations
are specific to the interface, so the second lane calibration is always present
even if only one is used.

Besides, this is done on purpose to enforce having all calibration handles in the
SoC DTSI file, because the second lane being used for this or that is something
board specific - so this avoids the (too usual) mistake of enabling two-lane PCIe
on a board while only one lane has calibration (which means none get calibrated).

So yes, it could be done, but it wasn't done on purpose.

In any case, should the need to declare only one lane calibration, it's still
something that can be done later with an if block.
