Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B974448F822
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 10:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469946; cv=none; b=blDbek+BT22vNjeHH9Qrwr0GobtH84gAfGAeXdJ5kxGiIxleEKiyczGoahl4W/4bP6D+qq2WQOU+yMgo5V3wXdZxOeXS8e3KQGgkX4xj7UlEg9ULTti24pQ8jhcnp9TLH8gOZnlZ+Y59AZOE0gu5RiA19OI90gxBrO//UBxkR6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469946; c=relaxed/simple;
	bh=OF6s/8vapHXvidtw33VYXC6IH3wg1QPKzTj+mPuHxvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jVM/u5AtgwJGCzNnV4D4FXjJbZvOcUc71fTsgoeAxc1zKel7gYUuSoPNCFSLAUgp5KfN7Mz4HlVufbWqpnQPNK8Plxp6pXhSgduvcAw3fuzyvi/2ywgKcHm7uimypx3LcrfkpCnMjRCfVwRSp9QBcGprqnJjH2qLcr/87XBJabY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LkSfh/M4; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LkSfh/M4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789469943;
	bh=OF6s/8vapHXvidtw33VYXC6IH3wg1QPKzTj+mPuHxvo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LkSfh/M4J0abz0GhCV9ib4q2Axf8YD8S3w806jqZ3ZNP0tHdemlV44qBHgUpcKMxq
	 NeEiI3XFV6Jlam5YBWkUBUAtNXrkTASc/Q3DM4EV2hUFDMEeklt9BTnkMsoq2rQO3E
	 ReQmZHAjG6m4gP0sjNE7zsFtHCARVVAYhh0/qHJ15aEUirOf2QGacwwEHey/N5RDBL
	 NLQQp4fiw8aEU480nAA02AUUdqo+PG26X/80bwP93emriesnwj9i8gkMFjdt+hxM8w
	 hYm2K8hY+5PVQkoSXFeS5qU+romtr1zEOLNCYIvvI4P3GplcLfodpNiwG4DzqAZBkN
	 S09VZCBRjkBUA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AE78217E015A;
	Tue, 15 Sep 2026 12:59:02 +0200 (CEST)
Message-ID: <58666d38-f453-4aa7-94d8-0f0370704df4@collabora.com>
Date: Tue, 15 Sep 2026 12:59:02 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] phy: mediatek: Add support for PCI-Express Gen4
 S-PHY
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 neil.armstrong@linaro.org, linux-phy@lists.infradead.org,
 conor+dt@kernel.org, olteanv@gmail.com
References: <20260915101022.23852-1-angelogioacchino.delregno@collabora.com>
 <20260915101022.23852-3-angelogioacchino.delregno@collabora.com>
 <20260915102629.EFF231F00893@smtp.kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260915102629.EFF231F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/26 12:26, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] phy: mediatek: endianness bug when reading split NVMEM cells in mtk_pcie_sphy_get_one_cal_para()
> --
> 
> commit ab276d5dc9414b3b5618ea96c84dcc086bdf9036
> Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> phy: mediatek: Add support for PCI-Express Gen4 S-PHY
> 
> This commit introduces the driver for the PCI-Express Gen4 S-PHY found in
> recent MediaTek SoCs such as MT6991 and MT8196. It implements the PHY
> initialization routines and handles reading eFuse calibration data from
> the NVMEM framework.
> 
>> diff --git a/drivers/phy/mediatek/phy-mtk-pcie-sphy.c b/drivers/phy/mediatek/phy-mtk-pcie-sphy.c
>> new file mode 100644
>> index 0000000000000..2bf10346ea97a
>> --- /dev/null
>> +++ b/drivers/phy/mediatek/phy-mtk-pcie-sphy.c
> [ ... ]
>> +static int mtk_pcie_sphy_get_one_cal_para(struct device *dev, const char *name, u8 max_val)
>> +{
>> +	u16 buf;
>> +	u8 tmp;
>> +	int ret;
>> +
>> +	/*
>> +	 * All of the calibrations are always max 8 bits long, but some may
>> +	 * be split between two different 8-bits cells: handle this corner
>> +	 * case by retrying reading as u16.
>> +	 */
>> +	ret = nvmem_cell_read_u8(dev, name, &tmp);
>> +	if (ret == 0)
>> +		buf = tmp;
>> +	else
>> +		ret = nvmem_cell_read_u16(dev, name, &buf);
> 
> [Severity: Medium]
> When an 8-bit (or smaller) NVMEM cell crosses a byte boundary in hardware,
> the NVMEM core evaluates its length as 2 bytes, causing nvmem_cell_read_u8()
> to fail with -EINVAL.
> 
> Does falling back to nvmem_cell_read_u16() cause an endianness issue here?

No, it reads fine.

> 
> Because the NVMEM core populates the buffer with a direct memory copy, the
> shifted valid data is placed in the first byte and zeroes in the second byte.
> On big-endian architectures

But this runs only on LE architectures.

>, interpreting this buffer directly as a native
> u16 variable evaluates to buf[0] << 8, which effectively multiplies the
> calibration value by 256. This could lead to spurious -ERANGE failures or
> incorrect calibration values being written to the PHY.
> 
> Would it be safer to use nvmem_cell_read_variable_le_u32() to handle these
> split cells robustly across different architectures?
> 
>> +
>> +	if (ret == -ENOENT) {
>> +		dev_info(dev, "No calibration for %s. Using defaults\n", name);
>> +		return -ENOENT;
>> +	} else if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				     "Cannot get calibration data for %s\n", name);
>> +
>> +	if (buf > max_val)
>> +		return dev_err_probe(dev, -ERANGE,
>> +				     "Bad value %u retrieved for %s.\n", buf, name);
>> +
>> +	return buf;
>> +}
> [ ... ]
> 
