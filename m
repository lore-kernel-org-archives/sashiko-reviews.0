Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770159;
	b=raxXMxtV/uoBm1bihvl49MjyjHDuY/XeS/jP8SqoFAB3MwxV4FeLai2IudvmHKyTPmTY
	 bqpoZwSpQk9qiXv30yfo1T+jXlW/eoLGw3N1aG1u/fZ7H/TKN04ad3D0Ks4xBeHCCTtZg
	 2Usg0q0S/Mpbrv4wkVKbOi2d1ts6jj329hLJl2A7t3U24mIdKFQbg0D7dl5V5uLUCo/QI
	 +JmtKZi5A3WeJv0OL61sOQAE2AwjyDK+GbV2ezPTWzQf7SWIOWXnWv74k13jVPnjlhAGR
	 nNHcxJHg0jQO3qgScmBOf3ZdpveHJaolW5V87xyh35ouhTcYF2zs/Y/13N/y+sJ+qBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770159;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=MddIBkgdQOFDGAQ07Ug9TP59jWzEEbHLbOPRkStxXzo=;
	b=LkUwyPl3lxYk3EplFWFA/RafUbRxda7Y2GWMk/ecdSo0qeJrPNOIEKG/OPyqbmKx2W6e
	 BVyGb2oOUVxBwLCA1QcwUtqYHWQIt2rTWEGVQt/L3kX7Vr9nTayYW1FQQoJ8zOUpcRnfI
	 GrXrnIeaSNGO0gbi57hwZntxHXO2KWeWn3O0CDZ+GxhwyM5MgHk7vfTcqfjHtd25EW0ap
	 HM2SExSNSQLnEaIQO/zT8sQ+oMgxjX7qO++RKT9EuYVpsAbTeLSiGvSrJkASOevkiyrsM
	 Iut0sN7K5qKA/whcynDnefV6CYmWDR597weCN9qmX265QZcds7ightTOzcUSlPA2Xxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702DD606A327
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 09:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 702DD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.66])
	by gateway (Coremail) with SMTP id _____8DxjdIpRwlrVIIjAA--.34926S3;
	Fri, 27 Nov 2026 17:02:33 +0800 (CST)
Received: from [127.0.0.1] (unknown [223.64.69.66])
	by front1 (Coremail) with SMTP id qMiowJDxTs8lRwlrqr43AA--.44776S2;
	Fri, 27 Nov 2026 17:02:31 +0800 (CST)
Message-ID: <fc2bca05-a705-4538-9457-da18b478792e@loongson.cn>
Date: Fri, 27 Nov 2026 17:02:29 +0800
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/7] thermal/drivers/loongson2: Add Loongson-2K0300
 support
To: sashiko-reviews@lists.linux.dev, daniel.lezcano@kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 Binbin Zhou <zhoubb.aaron@gmail.com>
References: <cover.1794211535.git.zhoubinbin@loongson.cn>
 <038de1cc102684e0abad6c25cac0138f065a0311.1794211535.git.zhoubinbin@loongson.cn>
 <sashiko-outbox-204590@kernel.org>
From: Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <sashiko-outbox-204590@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxTs8lRwlrqr43AA--.44776S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEECGsI5P0GNAABsF
X-Coremail-Antispam: 1Uk129KBj93XoWxuryDurW7uF4rWF43Aw18JFc_yoW5Zr1Dpa
	y5Aay5ArWDWrWDZw1jyw48AF4qq3sIyFy3Zrs7K3yruws8A34SgFyUtFy5X34xCrW7JF1U
	Zrn0qFW7C3Z8ZrXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2ID7UUUUU



On 2026/11/9 16:32, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] thermal/drivers/loongson2: unmasked trip IRQ in
>    ls2k0300_thermal_hw_init()
> --
> 
> commit 024ebeb46fbe6ba2893fe68297ad030cb9ce5fe2
> Author: Binbin Zhou <zhoubinbin@loongson.cn>
> 
> thermal/drivers/loongson2: Add Loongson-2K0300 support
> 
> This commit adds thermal sensor support for the Loongson-2K0300 SoC,
> reading calibration data from the CHIP ID syscon registers and falling
> back to an uncalibrated slope if the initial reading is out of range.
> 
>> diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loongson2_thermal.c
>> index 4ce162dfb1229..68e6105051c60 100644
>> --- a/drivers/thermal/loongson2_thermal.c
>> +++ b/drivers/thermal/loongson2_thermal.c
> [ ... ]
>> @@ -87,6 +122,107 @@ static int loongson2_thermal_set_trips(struct thermal_zone_device *tz, int low,
> [ ... ]
>> +static int ls2k0300_thermal_hw_init(struct platform_device *pdev,
>> +				    struct loongson2_thermal_data *data)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	int ret;
>> +
>> +	data->regmap_cfg = syscon_regmap_lookup_by_phandle(dev->of_node, "loongson,chipid");
>> +	if (IS_ERR(data->regmap_cfg))
>> +		return PTR_ERR(data->regmap_cfg);
>> +
>> +	ret = ls2k0300_thermal_read_calib(data);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to read calibration data");
>> +
>> +	writel(LS2K0300_THSENS_INIT_MASK, data->ctrl_reg + LS2K0300_THSENS_CFG_REG);
>> +
>> +	/*
>> +	 * Wait for the ADC to produce the first valid conversion before
>> +	 * using OUT_REG for the old-fuse sanity check.
>> +	 */
>> +	usleep_range(1000, 2000);
>> +
>> +	ls2k0300_thermal_detect_old_fuse(dev, data);
>> +
>> +	return 0;
>> +}
> [ ... ]
>> @@ -178,6 +314,10 @@ static int ls2k2000_thermal_hw_init(struct platform_device *pdev,
>>   	return 0;
>>   }
>>   
>> +static const struct thermal_zone_device_ops ls2k0300_thermal_zone_ops = {
>> +	.get_temp = ls2k0300_thermal_get_temp,
>> +};
> 
> [Severity: Medium]
> Can this cause a thermal interrupt storm on Loongson-2K0300 if trip
> interrupts were left enabled by firmware or a previous kernel across
> kexec?
> 
> Unlike ls2k1000_thermal_hw_init() and ls2k2000_thermal_hw_init(),
> ls2k0300_thermal_hw_init() does not clear LOONGSON2_THSENS_STATUS_REG or
> disable trip-point interrupts, while loongson2_thermal_probe() still
> unconditionally registers loongson2_thermal_irq_thread().  Because
> ls2k0300_thermal_zone_ops omits .set_trips, thermal_zone_device_update()
> in the IRQ handler cannot update the hardware trip window or mask the
> interrupt enable bit, so the comparator will keep re-asserting the
> level-triggered interrupt on subsequent ADC conversions.

The Loongson-2K0300 thermal sensor hardware does not have a trip-point 
comparator circuit — so .set_trips is intentionally absent, so I think 
the interrupt-storm scenario you describe cannot occur on this SoC variant.
> 

-- 
Thanks.
Binbin

