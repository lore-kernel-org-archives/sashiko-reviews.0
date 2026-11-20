Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795138756;
	b=aUVhsnzUBwRRBXqRWwJS0bqi7fbWW8ieTwDcaxXxNnuXv3S7r3GBoBZCPABoGDwX+EJI
	 rIfHoMeam4e+amqNAQJsiGOUIuNJLTTUhKmluqKVSikUITc1iClBynHxjxEXb5dV9jInD
	 0JsxptZyog886SwGWNJRZC5E5MWm5wybP8LD1JAuaYqFNgfy5XURG0MGwDtqRxDbe0deC
	 e28V6Jt4bGNcmjvSrw9OeHAP/1bvpDPlcgV71Yz7pXpmumGugJnLEJeV/Uhi9Rs8rsEmF
	 b5g+dP7O6zzU9fW0XYVyaI1yapZERndiOBU7SH6BpKopSVLFU0C1cVQTsmBJfgmyZbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795138756;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
	bh=+4gtkgXVA0XgvD3lHDgwF805+IW47uvAyK6BBLzsiWc=;
	b=2KfWQKqq51O5HoNHEU6/d72ugTRBm8Nq7kw21DxfdlR6msxNhcjcNHOcSByLv8oHVa9T
	 T02V02Oo8aMjDyI6s5I9Jnpxlf61laPFyTpbvhlsQD8o4YCx+oK4bg8tMgik2yqmPQ/qu
	 JuhIaoOe8n+ry4h6rGaNx7JHT3NHKWWPkloSo87/YBS7jWkt0HsLCU95PF4FkMv4pIJmG
	 IkafSgaQm/rujaqcUzr0Ikz4RJpgC44VEbOldrKAl2sbSfImsdnfSoet109m8SwN0i+38
	 XilAgICm1mPV1Eu61pj5ks+VwNy2mFJc6U/lV4am5VSxQzo1Zz+6jCup/DX7CRyCAgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=YEGxNLbX;
	arc=none smtp.remote-ip=113.46.200.224
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8B0606A325
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 01:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D8B0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=YEGxNLbX
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+4gtkgXVA0XgvD3lHDgwF805+IW47uvAyK6BBLzsiWc=;
	b=YEGxNLbXrNCRiru6LRF6hWowaGfDswvDpCmI4ThObmvLxg3n9h+I9exKU+l5G5/i11HIQ3uJ0
	EKgxngWBrEunNgHJggfTYpohImC4YVhr0grgxR5t5j5FvCw+t8yN1kKDJ1CDgUla4OyG4clwDe9
	5gGcuwE8gBWx+6lB+YSNYDU=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jVyfd5NJHz1cypj;
	Fri, 20 Nov 2026 09:38:49 +0800 (CST)
Received: from whupemo500017.china.huawei.com (unknown [7.152.184.243])
	by mail.maildlp.com (Postfix) with ESMTPS id A18C84055B;
	Fri, 20 Nov 2026 09:39:10 +0800 (CST)
Received: from [10.67.108.64] (10.67.108.64) by whupemo500017.china.huawei.com
 (7.152.184.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 20 Nov
 2026 09:39:09 +0800
Message-ID: <c0880561-cc89-43d6-b305-69e6821090fa@huawei.com>
Date: Fri, 20 Nov 2026 09:39:09 +0800
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
Subject: Re: [PATCH -next 1/2] ASoC: SOF: ipc4-control: Fix out-of-bounds
 backup restore in bytes ext put
To: <sashiko-reviews@lists.linux.dev>
CC: <linux-sound@vger.kernel.org>
References: <20261119121446.124833-1-yeweihua4@huawei.com>
 <sashiko-outbox-223133@kernel.org>
Content-Language: en-US
From: Weihua Ye <yeweihua4@huawei.com>
In-Reply-To: <sashiko-outbox-223133@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 whupemo500017.china.huawei.com (7.152.184.243)


On 2026/11/19 21:04, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issues to consider:
> - [Medium] ASoC: SOF: restored scontrol->size overwritten in
>    sof_ipc4_bytes_ext_put()
> - [Medium] ASoC: SOF: scontrol->size not restored on EFAULT in
>    sof_ipc4_bytes_ext_put()
> - [Medium] ASoC: SOF: ipc4-control: incomplete backup restore when
>    priv_size is 0
> - [Medium] ASoC: SOF: ipc4-control: incomplete msg restore in
>    sof_ipc4_set_get_kcontrol_data()
> --
>
> commit 3d54ef5fbf4ff729417838f0907d7062db9c4154
> Author: Ye Weihua <yeweihua4@huawei.com>
>
> ASoC: SOF: ipc4-control: Fix out-of-bounds backup restore in bytes ext put
>
> This commit records the backup size in old_ipc_control_data_size to avoid an
> out-of-bounds read when restoring bytes control data, restores msg->data_size
> when replaying the backup, and moves the scontrol->size update in
> sof_ipc4_bytes_ext_put() until after sof_ipc4_set_get_bytes_data() returns.
>
>> diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
>> index e29c8d89284af..f8b4842f39365 100644
>> --- a/sound/soc/sof/ipc4-control.c
>> +++ b/sound/soc/sof/ipc4-control.c
>> @@ -58,6 +58,8 @@ static int sof_ipc4_set_get_kcontrol_data(struct snd_sof_control *scontrol,
>>   
>>   	/* It is a set-data operation, and we have a valid backup that we can restore */
>>   	if (ret < 0) {
>> +		struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
>> +
>>   		if (!scontrol->old_ipc_control_data)
>>   			goto unlock;
>>   		/*
>> @@ -65,9 +67,18 @@ static int sof_ipc4_set_get_kcontrol_data(struct snd_sof_control *scontrol,
>>   		 * configuration
>>   		 */
>>   		memcpy(scontrol->ipc_control_data, scontrol->old_ipc_control_data,
>> -		       scontrol->size);
>> +		       scontrol->old_ipc_control_data_size);
>> +		scontrol->size = scontrol->old_ipc_control_data_size;
>>   		kfree(scontrol->old_ipc_control_data);
>>   		scontrol->old_ipc_control_data = NULL;
>> +		scontrol->old_ipc_control_data_size = 0;
>> +		/*
>> +		 * If the message payload points into the restored buffer, its size
>> +		 * must be restored as well, otherwise the last known good
>> +		 * configuration would be sent with the size of the rejected data.
>> +		 */
>> +		if (msg->data_ptr == cdata->data->data)
>> +			msg->data_size = cdata->data->size;
>>   		/* Send the last known good configuration to firmware */
>>   		ret = iops->set_get_data(sdev, msg, msg->data_size, set);
>>   		if (ret < 0)
> [Severity: Medium]
> Does checking msg->data_ptr == cdata->data->data miss generic bytes controls
> (SOF_IPC4_BYTES_CONTROL_PARAM_ID) and leave msg->extension un-restored?
>
> When data->type == SOF_IPC4_BYTES_CONTROL_PARAM_ID,
> sof_ipc4_set_get_bytes_data() calls sof_ipc4_set_bytes_control_data(), which
> copies the new payload into a separate msg_data buffer and sets
> msg.data_ptr = msg_data:
>
> sound/soc/sof/ipc4-control.c:sof_ipc4_set_bytes_control_data() {
> 	...
> 	msg_data->id = cdata->index;
> 	msg_data->num_elems = data->size;
> 	memcpy(msg_data->data, data->data, data->size);
>
> 	memcpy(&msg, &cdata->msg, sizeof(msg));
> 	msg.extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(data->type);
>
> 	msg.data_ptr = msg_data;
> 	msg.data_size = data_size;
>
> 	ret = sof_ipc4_set_get_kcontrol_data(scontrol, &msg, true, lock);
> 	...
> }
>
> Because msg->data_ptr points to msg_data rather than cdata->data->data, the
> replay call re-sends the rejected msg_data buffer and size instead of the
> restored backup.  Even when msg->data_ptr == cdata->data->data,
> sof_ipc4_bytes_ext_put() overwrites data->type from user space before
> sof_ipc4_set_get_bytes_data() sets msg.extension, so msg->extension is not
> restored from the backed-up cdata->data->type either.
Pre-existing issue, will fix in another patch.
>> @@ -630,6 +641,7 @@ static int sof_ipc4_bytes_ext_put(struct snd_sof_control *scontrol,
>>   	struct sof_abi_hdr *data = cdata->data;
>>   	struct sof_abi_hdr abi_hdr;
>>   	struct snd_ctl_tlv header;
>> +	int ret;
>>   
>>   	/*
>>   	 * The beginning of bytes data contains a header from where
>> @@ -686,21 +698,25 @@ static int sof_ipc4_bytes_ext_put(struct snd_sof_control *scontrol,
>>   							 scontrol->size, GFP_KERNEL);
>>   		if (!scontrol->old_ipc_control_data)
>>   			return -ENOMEM;
>> +		scontrol->old_ipc_control_data_size = scontrol->size;
>>   	}
> [Severity: Medium]
> Can backing up and restoring scontrol->size bytes leave cdata->data
> un-restored when a bytes control has no initial topology payload?
>
> In sof_ipc4_control_load_bytes(), scontrol->size is initialized to
> sizeof(*control_data) + scontrol->priv_size.  When scontrol->priv_size is 0,
> scontrol->size is only sizeof(*cdata), which stops before the flexible array
> member cdata->data (struct sof_abi_hdr).  kmemdup() then backs up 0 bytes of
> cdata->data, and on failure of copy_from_user() or iops->set_get_data(),
> memcpy(..., scontrol->old_ipc_control_data_size) restores only sizeof(*cdata)
> bytes, leaving the rejected ABI header and payload in cdata->data and
> replaying the rejected cdata->data->size and payload to the firmware.
Pre-existing issue, will fix in another patch.
>>   	/* Copy the whole binary data which includes the ABI header and the payload */
>>   	if (copy_from_user(data, tlvd->tlv, header.length)) {
>>   		memcpy(scontrol->ipc_control_data, scontrol->old_ipc_control_data,
>> -		       scontrol->size);
>> +		       scontrol->old_ipc_control_data_size);
>>   		kfree(scontrol->old_ipc_control_data);
>>   		scontrol->old_ipc_control_data = NULL;
>> +		scontrol->old_ipc_control_data_size = 0;
>>   		return -EFAULT;
>>   	}
> [Severity: Medium]
> Should this error path also restore
> scontrol->size = scontrol->old_ipc_control_data_size, like
> sof_ipc4_set_get_kcontrol_data() does?
>
> Because scontrol->old_ipc_control_data is kept across successful updates
> while later updates change scontrol->size, a copy_from_user() failure on a
> subsequent call restores the older backup into scontrol->ipc_control_data
> without resetting scontrol->size, causing the next sof_ipc4_bytes_ext_put()
> to kmemdup() the wrong size.
Pre-existing issue, will fix in another patch.
>> -	/* Update the cdata size */
>> -	scontrol->size = sizeof(*cdata) + header.length;
>> +	ret = sof_ipc4_set_get_bytes_data(sdev, scontrol, true, true);
>> +	if (!ret)
>> +		/* Update the cdata size */
>> +		scontrol->size = sizeof(*cdata) + header.length;
>>   
>> -	return sof_ipc4_set_get_bytes_data(sdev, scontrol, true, true);
>> +	return ret;
>>   }
> [Severity: Medium]
> Does this overwrite the restored scontrol->size with the rejected payload
> size whenever the backup replay succeeds?
>
> When the firmware rejects the new payload in
> sof_ipc4_set_get_kcontrol_data(), the recovery path restores
> scontrol->size = scontrol->old_ipc_control_data_size, frees
> scontrol->old_ipc_control_data, and calls:
>
> 	ret = iops->set_get_data(sdev, msg, msg->data_size, set);
>
> When replaying the backup configuration succeeds, ret becomes 0 and
> sof_ipc4_set_get_bytes_data() returns 0.  Then if (!ret) here overwrites the
> restored scontrol->size with sizeof(*cdata) + header.length from the rejected
> request, so the next sof_ipc4_bytes_ext_put() backs up the wrong size.

Will send v2 to fix this, thanks.

