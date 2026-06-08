Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA98325782A
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 11:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780918153; cv=none; b=jY7gc2d7cySBStRE7VOTh0FicCgruN3xPcDhoXCe9DiOoBI08HWOarQtmr+VYAlzrrb75OFdLFgKOLLlt4Un0GXiE09FkvxtJJ7Kr4yfPZG6vfK06p93gMZMnoC/vH70E4bEDlLClCqVd0OJjKi//PpWz1UEtpiKvb4nGGNjXxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780918153; c=relaxed/simple;
	bh=3x0aOUZX+5j2r+yYOPgsPYoX8m0BOF46dMlnqDTMiqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JFCJnb5JFK82Y8YE6NKWtF99COieykMm2avWFMh8Ux5hWQNUpHZsaCFKrf1TxcrL1iA1tAQ0NaSpZ6FEBVwG3k8Zs3eMssYH6pBxmlDqUDEpNdmdo8Re0XZ5xmV9JP7auaO/YZ9C0eFBTOXT2jSbkJpX/B0nI3fyA7IO2Z//Vgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QyCnZtJ0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QyCnZtJ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780918151;
	bh=3x0aOUZX+5j2r+yYOPgsPYoX8m0BOF46dMlnqDTMiqA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QyCnZtJ0jUH3f+W/jfgRTT0z7go4snN7wpa4dbNnjrjny7fv6mvZ4ZJ9yE1TNp1SB
	 B+AvcjFU1Jkl/dq5KgnpNVdV4gDUUQQ5N69W0OG+VhGWr9qIyVHsn6X+Lor1dxPT3t
	 Q98BEdc2AaeQeOIy99kmE97NSXbHaCSrPZGeXQQ33HU8vU18JwvGxA2+jT6nA8Y8p0
	 GUWJI+BeiofGMnO6cBN4uoyaB8ZCq3MOfHMgKUHvg7RasNLFslAGKoyr5PECJKAqgd
	 j0Op1I7k/DQPUak6AVFycZanEbRYtMOxx599/GyNYRIxW0pbO+dqYgqeObJhnuLc1C
	 5XDFGYMlo969A==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CA89217E02F1;
	Mon,  8 Jun 2026 13:29:10 +0200 (CEST)
Message-ID: <69217ce5-d7c7-4fb0-8d58-e78c0ef8514f@collabora.com>
Date: Mon, 8 Jun 2026 13:29:10 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 02/10] spmi: Print error status with %pe format
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-phy@lists.infradead.org,
 vkoul@kernel.org, olteanv@gmail.com
References: <20260608100949.36309-3-angelogioacchino.delregno@collabora.com>
 <20260608103702.411271F00893@smtp.kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260608103702.411271F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/8/26 12:37, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The OF device node assigned to the newly allocated SPMI device does not have its reference count incremented, creating a potential use-after-free condition when the iterator macro automatically drops the reference.
> --
> 
> commit eb2ded032315a7ba1f8c878f6e0a10db80cf0346
> Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> spmi: Print error status with %pe format
> 
> This commit updates error messages in the SPMI driver to use the %pe format
> specifier for printing error statuses instead of printing integer error codes.
> 
>> diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi.c
>> index e93fc2c957590..95db19a0a44ec 100644
>> --- a/drivers/spmi/spmi.c
>> +++ b/drivers/spmi/spmi.c
> [ ... ]
>> @@ -522,7 +522,7 @@ static void of_spmi_register_devices(struct spmi_controller *ctrl)
>>   		err = spmi_device_add(sdev);
>>   		if (err) {
>>   			dev_err(&sdev->dev,
>> -				"failure adding device. status %d\n", err);
>> +				"failure adding device. status %pe\n", ERR_PTR(err));
> 
> [Severity: High]
> This is a pre-existing issue, but I noticed a potential use-after-free
> condition with the OF node reference counting.
> 
> In drivers/spmi/spmi.c:of_spmi_register_devices(), the
> for_each_available_child_of_node() loop iterates through child nodes,
> automatically calling of_node_put() on the previous node when advancing.
> 
> Inside the loop, the node is assigned to the SPMI device:
> 
> 	device_set_node(&sdev->dev, of_fwnode_handle(node));
> 
> Does this assignment need to invoke of_node_get() to increment the node's
> reference count? Without it, when the loop advances, the node's reference
> is dropped, leaving sdev->dev.of_node as a dangling pointer.
> 
> If the device tree node is dynamically managed (e.g., via DT overlays),
> unloading the overlay will free the node, causing a use-after-free whenever
> the active SPMI device later accesses its of_node.
> 
> Additionally, drivers/spmi/spmi.c:spmi_dev_release() lacks an of_node_put()
> to balance the required reference:
> 
> static void spmi_dev_release(struct device *dev)
> {
> 	struct spmi_device *sdev = to_spmi_device(dev);
> 
> 	kfree(sdev);
> }
> 
> Should spmi_dev_release() be updated to safely release the reference once
> it is correctly obtained?
> 
>>   			spmi_device_put(sdev);
>>   		}
>>   	}
> 

Although very unlikely to happen at this moment in time, this is a valid concern.

It's out of scope for this series - so I will send a fix separately.
This should not block this series.

Cheers,
Angelo
