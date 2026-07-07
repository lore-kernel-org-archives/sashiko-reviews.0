Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC191A6813
	for <sashiko-reviews@lists.linux.dev>; Tue,  7 Jul 2026 11:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783422833; cv=none; b=MP38tfj6efobc6U84j3jYknFzlhS4RKx4OkeBflsZ813D0ENbwBjb9beY23AxndurnsNF0tnwnJ0Ypo0X86ZvYAZX2e3wpNpnVsJ5Tq1Qd6YInjcho0NxC6JuptzOARqCEU/rv726JQZbMlS6UCRvFfMvbCQ1qi//GAZd5C24hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783422833; c=relaxed/simple;
	bh=4pZ6MZzL7aLOwbeE7xX19WV26YSUOsI1YK/AvwuJ7ts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RgvH3m8hpXRIJtatk4+bu+l0cWrhyHWV1kwXmLa0r8+dnlERlYMbpI7Qn1TbZ40Pm+nYCrt84XmytrHRAPT4bwRzjhU3GyNfFxTTPdUE0jz4bh1bbH5pcv5aadQXciO254mkDJqw3qf6/97UBllU83yRfUkAVKVAarptQzbVMCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mu1jZlX1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mu1jZlX1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783422829;
	bh=4pZ6MZzL7aLOwbeE7xX19WV26YSUOsI1YK/AvwuJ7ts=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mu1jZlX1jL5BdleOazzl2StSHJsXjuOb/8qNm93rS3pFKB/5sTJ5Y02Z0mrJi+x5N
	 m65r1Lj6PWGbZeZZLQiSzcKn9rgLpfGTNU3UC9oR9MUSeZbfFv+YbVQIckXqjowq08
	 NsS4lG1yTnbxUCpvP8TC7uWoSLe6ZaSQGXF0LiZjua6F1pWHx7EbbcBASI05bwMqss
	 d4qpm3GCOf78ZvzatGE6HXHjrakQ7j7HBZQ+Qyn23hx1tAV0Pn1uuxljbFcqZUsi7Q
	 n1hz3sNInHri7AkdfAKprejR14DwmqLgrX3TdrWyYJayy5Qh0k5DG9XHB7SCQGtT7T
	 bwk4C7qoSLyUw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 25C6617E018C;
	Tue, 07 Jul 2026 13:13:49 +0200 (CEST)
Message-ID: <cbf03eaa-87c9-4cc4-b84b-950055748f0b@collabora.com>
Date: Tue, 7 Jul 2026 13:13:48 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 05/12] spmi: Implement spmi_subdevice_alloc_and_add()
 and devm variant
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org,
 linux-phy@lists.infradead.org
References: <20260707101821.173319-1-angelogioacchino.delregno@collabora.com>
 <20260707101821.173319-6-angelogioacchino.delregno@collabora.com>
 <20260707104853.6F5161F000E9@smtp.kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260707104853.6F5161F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/7/26 12:48, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] `spmi_subdevice_alloc_and_add()` merges device allocation and registration, preventing callers from safely setting device properties before driver matching.
> - [Medium] Missing `of_node_put()` in `spmi_subdev_release()` leads to a device tree node reference count leak.
> --
> 
> --- Patch [5]: [PATCH v11 05/12] spmi: Implement spmi_subdevice_alloc_and_add() and devm variant ---
> commit a8b1557eae1d7ee7a9490cb239a6b54f95758f0d
> Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> spmi: Implement spmi_subdevice_alloc_and_add() and devm variant
> 
> This commit adds new functions to allocate, add, and remove sub-devices of
> an SPMI device. It introduces spmi_subdevice_alloc_and_add() along with
> its devm_* variant to support complex PMICs with multiple sub-features.
> The symbols are exported under a new "SPMI" namespace.
> 
> diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi.c
> index 14ec9de58467a..16ffcb1370089 100644
> --- a/drivers/spmi/spmi.c
> +++ b/drivers/spmi/spmi.c
> @@ -34,6 +35,19 @@ static const struct device_type spmi_dev_type = {
> 
> [ ... ]
> 
>> +static void spmi_subdev_release(struct device *dev)
>> +{
>> +	struct spmi_device *sdev = to_spmi_device(dev);
>> +	struct spmi_subdevice *sub_sdev = container_of(sdev, struct spmi_subdevice, sdev);
>> +
>> +	ida_free(&spmi_subdevice_ida, sub_sdev->devid);
>> +	kfree(sub_sdev);
>> +}
> 
> [Severity: Medium]
> Does this leak the device tree node reference count?
> 
> If a caller assigns an of_node to the subdevice (for example,
> sdev->dev.of_node = of_node_get(child)), the standard spmi_dev_release()
> handles cleanup by calling of_node_put(dev->of_node).

The caller shall take care of its own resources refcounts, we can't assume in the
API that the caller did or did not do anything. There's no magic 8 ball to use.

> 
> Should spmi_subdev_release() include this same cleanup when the device
> reference count reaches zero upon unregistration?
> 
> [ ... ]
> 
>> +struct spmi_subdevice *spmi_subdevice_alloc_and_add(struct spmi_device *sparent)
>> +{
>> +	struct spmi_subdevice *sub_sdev;
>> +	struct spmi_device *sdev;
>> +	int ret;
>> +
>> +	sub_sdev = kzalloc_obj(*sub_sdev);
>> +	if (!sub_sdev)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	sdev = &sub_sdev->sdev;
>> +	sdev->ctrl = sparent->ctrl;
>> +	sdev->usid = sparent->usid;
>> +
>> +	ret = ida_alloc(&spmi_subdevice_ida, GFP_KERNEL);
>> +	if (ret < 0) {
>> +		kfree(sub_sdev);
>> +		return ERR_PTR(ret);
>> +	}
>> +	sub_sdev->devid = ret;
>> +
>> +	device_initialize(&sdev->dev);
>> +	sdev->dev.parent = &sparent->dev;
>> +	sdev->dev.bus = &spmi_bus_type;
>> +	sdev->dev.type = &spmi_subdev_type;
>> +
>> +	ret = dev_set_name(&sdev->dev, "%u-%02x.%u.auto",
>> +			   sdev->ctrl->nr, sdev->usid, sub_sdev->devid);
>> +	if (ret)
>> +		goto err_put_dev;
>> +
>> +	ret = device_add(&sdev->dev);
> 
> [Severity: High]
> Does combining allocation and registration into a single function prevent
> callers from properly configuring the device before driver matching occurs?
> 
> Because device_add() emits a KOBJ_ADD uevent and triggers bus matching,
> if a parent driver needs to assign an of_node or fwnode for matching,
> it is forced to do so after this function returns.
> 
> Setting dev.of_node after registration results in the KOBJ_ADD uevent
> lacking the OF_COMPATIBLE modalias, which breaks module autoloading and
> causes the initial driver probe to fail.
> 
> Would it be safer to separate the allocation and addition steps so callers
> have a window to set device properties?
> 

No. Simply no.

>> +	if (ret) {
>> +		dev_err(&sdev->dev, "Can't add device, status %pe\n", ERR_PTR(ret));
>> +		goto err_put_dev;
>> +	}
>> +
>> +	return sub_sdev;
>> +
>> +err_put_dev:
>> +	put_device(&sdev->dev);
>> +	return ERR_PTR(ret);
>> +}
> 
