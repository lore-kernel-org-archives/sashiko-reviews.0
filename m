Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9516840BCBB
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 11:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595461; cv=none; b=JythobTytZCCmUKTmcNBgxJWABtSmSsmdioSDkhaCOSw2AAYdpJCCIBxdVeBgcT4uijQ2k6qlaPbWBpc7GvYUzsidYU+Vm5jHqLHzZBRVhzM+lqRQfcE2J0E6VjuprUmzxU1goCXhzyS7ujgrSwuML2/5dAi6WMaHM3byPwyXJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595461; c=relaxed/simple;
	bh=ApBrtV4Zk1vMOIRF4PFrz5yF0iT0J5bqhkZRZmYO4To=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lYTZHZHh/EZBxaPsgP8jfSlJ29Ts+ZHxNxhVj7IrmXtTkUqJgNrJHfLy5ezijAjLqKfxvkZ7Up5+Ho8jF9iBmTRp3sPY6rXrDC5gS7weEwfLmfsXdDUvZg9dw4bQDfCS9RWvCpaYr1gwcY9czb2Seeqj21s9iNRmOOFDp4h14o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=d9s/5a7C; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="d9s/5a7C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783595458;
	bh=ApBrtV4Zk1vMOIRF4PFrz5yF0iT0J5bqhkZRZmYO4To=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d9s/5a7CzcXq78v/5VAqzjyVuLk3p9/cbXnMrh6GmsrfJhjTx7UGjiyd6QhazjVZa
	 pp8AfMES9pZcjdtg+nzihx9FiBQiCkCB/zLumVzI6bzrbPPfINilcTDl/yPw0H2znn
	 oFzAZGTz54XIJuxzJitevUnGzuj25mDuiyXiZklc4hTGilmnd00KECd/9WJCRFe3Rj
	 Uj3kS7at8sHfPM3fKeyW9byUukBqfsrIrvv2/z7nA6BXDSAZYfJ2p56BkvCqViypxC
	 +avucc3E5pH+BMLxm58aBvMD7yPyc83dbjmrZFMeJhRRYtnNwp2OEVHs7e2l0deYAl
	 pcGIfIdNvoLxQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B093417E0886;
	Thu, 09 Jul 2026 13:10:57 +0200 (CEST)
Message-ID: <d745a43c-cc24-454b-91f0-79c72862656d@collabora.com>
Date: Thu, 9 Jul 2026 13:10:57 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] drm/mediatek: mtk_dp: Fix hdmi codec and phy
 driver unregistration
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org
References: <20260709103431.46616-1-angelogioacchino.delregno@collabora.com>
 <20260709103431.46616-4-angelogioacchino.delregno@collabora.com>
 <20260709104650.BFBE51F000E9@smtp.kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260709104650.BFBE51F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/9/26 12:46, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [Critical] Double free / use-after-free of mtk_dp->phy_dev on devm_phy_get error path.
> 
> Pre-existing issues:
> - [High] Asynchronous pm_runtime_put() used immediately before pm_runtime_disable() leaves hardware in incorrect power state.
> --
> 
> --- Patch [3]: [PATCH v3 03/11] drm/mediatek: mtk_dp: Fix hdmi codec and phy driver unregistration ---
> commit ee2a644d342bfbaa916286b22d4e54ddc62e5878
> Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> drm/mediatek: mtk_dp: Fix hdmi codec and phy driver unregistration
> 
> This commit adds devm actions to unregister the HDMI Codec and DisplayPort
> PHY platform devices during probe. This prevents multiple instances of these
> devices from being registered if the driver probe is deferred.
> 
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
>> index eefbc7e0f9c8d..fefd1fae44c90 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> [ ... ]
>> @@ -2701,6 +2718,11 @@ static int mtk_dp_register_phy(struct mtk_dp *mtk_dp)
>>   		return dev_err_probe(dev, PTR_ERR(mtk_dp->phy_dev),
>>   				     "Failed to create device mediatek-dp-phy\n");
>>   
>> +	ret = devm_add_action_or_reset(dev, mtk_dp_unregister_pdevs, mtk_dp->phy_dev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				     "Failed to add phy unregister devm action");
>> +
>>   	mtk_dp_get_calibration_data(mtk_dp);
>>   
>>   	mtk_dp->phy = devm_phy_get(&mtk_dp->phy_dev->dev, "dp");
>>   	if (IS_ERR(mtk_dp->phy)) {
>>   		platform_device_unregister(mtk_dp->phy_dev);

It's really too hot in July in Italy. Uff. :-)

> 
> [Severity: Critical]
> Does this create a double-free on the error path?
> 
> Looking at mtk_dp_register_phy() in drivers/gpu/drm/mediatek/mtk_dp.c, if
> devm_phy_get() fails (returning e.g. -EPROBE_DEFER), we manually call
> platform_device_unregister() here.
> 
> However, since we successfully added the devm action earlier in the function,
> returning the error from probe will cause the devres unwind mechanism to
> execute mtk_dp_unregister_pdevs().
> 
> Won't that call platform_device_unregister() a second time on the already-freed
> mtk_dp->phy_dev pointer, resulting in memory corruption?
> 
> [ ... ]
>> @@ -2870,9 +2892,6 @@ static void mtk_dp_remove(struct platform_device *pdev)
>>   	struct mtk_dp *mtk_dp = platform_get_drvdata(pdev);
>>   
>>   	pm_runtime_put(&pdev->dev);
>>   	pm_runtime_disable(&pdev->dev);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but is it safe to call
> pm_runtime_put() immediately before pm_runtime_disable() here in
> mtk_dp_remove()?
> 
> Since pm_runtime_put() queues an asynchronous suspend, calling
> pm_runtime_disable() right after it cancels the pending suspend work.
> 
> Doesn't this leave the hardware in an active power state after the driver is
> removed? Should this be changed to pm_runtime_put_sync() to ensure the suspend
> completes before module unload?
> 

Nice. Yes.

>>   	if (mtk_dp->data->bridge_type != DRM_MODE_CONNECTOR_eDP)
>>   		timer_delete_sync(&mtk_dp->debounce_timer);
>> -	platform_device_unregister(mtk_dp->phy_dev);
>> -	if (mtk_dp->audio_pdev)
>> -		platform_device_unregister(mtk_dp->audio_pdev);
>>   }
> 

