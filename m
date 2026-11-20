Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174924;
	b=f+zBsK5TX7vLKg0eLplppcjpVrDxH7suzVAbwfDtsXn3aCUihnLjoOZv2Mz/l3F8S5Mr
	 q4bZkugBRHZsMclXvJ8h7WCK/iqeRSFrKVsDbELw8IJRrhq2vwzVRTvpzvZkU2SqLMlbh
	 EyAOnWVX4lKuUkTTMrr2KkR/Tn0sflGqNP7q0U/aBx3j3OkD1lKrykCfhvMeLO3vhmNqJ
	 3ZWhmhyeFql/z8muAkd868eD31y2UahO4skp+zYciIBLBojyklqV+1oDieIu5IDvMsg5F
	 L/pAL6X23Lg+2HUcEFRegMiUpc7H3E3z5wDcv9jF08jpY0lPTyjqcnVr7g1Za2opEDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174924;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Flag:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Score;
	bh=0sY9jQr5X1Oxc5rgpMPkHAnGiLMn1T1cPmD9U1gC6IQ=;
	b=Z21NT2FrAeKPmEpeZChiEGcHQoW1dpedW6mfbl4FNZ6PWVPyuiFSoPgT6xs88T3rfJ3a
	 jdPANseuKTbQDZV6J2fn0wetZczwmlL1wn80dxrKWTRbPOMiHk8wO8kb8imMeoBo080VG
	 Js1ZqBvVLMe3w2eFoIyVfyzc/3qIOkT8rULYOtV35n/qLiNnMEz0vcgjclrEb1VhIaqqb
	 O/sS/0PjIEfdhSqF7ebuEKaAQ26XEFGa1cGvZHKU/3jgfRH4tHJ5OjKpc+PoOI/u6LT4l
	 s9VXy+sY5hUPy50icdHI2Mb7jB5h1Q2TzSIunYIWgSI29LiAoryRSYTujtJERX2l42Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="hbkbBj/o";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="/TmPF+in";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="hbkbBj/o";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="/TmPF+in";
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0393F606A32A
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 11:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0393F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=hbkbBj/o;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/TmPF+in;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=hbkbBj/o;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/TmPF+in
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2C9A01F399;
	Fri, 20 Nov 2026 11:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795174922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0sY9jQr5X1Oxc5rgpMPkHAnGiLMn1T1cPmD9U1gC6IQ=;
	b=hbkbBj/oUeLIKeKzreg+oOYED+/+BBOElgcjUbyyXlzag/Ljsft5Ka/Db7s192b9LJJ7Jy
	HgK71XifD6qL1KMZUbuAtiPdzFKEZG0Fs8MDyyC/ioRfiS3Ykg1voIWsl8eTjhyxRi6Vhs
	xxQEdU1aludrAYY9+5dBVe97AfxnjRE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795174922;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0sY9jQr5X1Oxc5rgpMPkHAnGiLMn1T1cPmD9U1gC6IQ=;
	b=/TmPF+inACsxNagfoEcVWQCBKyRTHgyUMQNVPxSOThgUszK5WKYXXyZD4xdDu0vD7eI3SZ
	ttzd1If/spc32nCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795174922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0sY9jQr5X1Oxc5rgpMPkHAnGiLMn1T1cPmD9U1gC6IQ=;
	b=hbkbBj/oUeLIKeKzreg+oOYED+/+BBOElgcjUbyyXlzag/Ljsft5Ka/Db7s192b9LJJ7Jy
	HgK71XifD6qL1KMZUbuAtiPdzFKEZG0Fs8MDyyC/ioRfiS3Ykg1voIWsl8eTjhyxRi6Vhs
	xxQEdU1aludrAYY9+5dBVe97AfxnjRE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795174922;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0sY9jQr5X1Oxc5rgpMPkHAnGiLMn1T1cPmD9U1gC6IQ=;
	b=/TmPF+inACsxNagfoEcVWQCBKyRTHgyUMQNVPxSOThgUszK5WKYXXyZD4xdDu0vD7eI3SZ
	ttzd1If/spc32nCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 021561348F;
	Fri, 20 Nov 2026 11:42:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 00EFMwkyAGtUAQAAD6G6ig
	(envelope-from <hare@suse.de>); Fri, 20 Nov 2026 11:42:02 +0000
Message-ID: <68297149-c8d3-4dee-997e-5821698b4e23@suse.de>
Date: Fri, 20 Nov 2026 12:42:01 +0100
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
Subject: Re: [PATCH v4 1/9] nvme-auth: modify nvme_auth_transform_key() to
 return status
To: sashiko-reviews@lists.linux.dev, Hannes Reinecke <hare@kernel.org>
Cc: linux-nvme@lists.infradead.org
References: <20261120-dhchap-keyring-v4-v4-0-5f8c7d9926ee@kernel.org>
 <20261120-dhchap-keyring-v4-v4-1-5f8c7d9926ee@kernel.org>
 <sashiko-outbox-225021@kernel.org>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <sashiko-outbox-225021@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-13.28 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-0.995];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -13.28

On 11/20/26 12:19 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [High] nvme-auth: NULL pointer dereference in
>    nvme_auth_transform_key()
> - [Low] nvme-auth: unused variable transformed_data in
>    nvme_auth_transform_key()
> - [Low] nvme-auth: missing memzero_explicit() on error in
>    nvme_auth_transform_key()
> --
> 
> commit b03dd5c2705fd9466c887dbc6671b901be8cc15b
> Author: Hannes Reinecke <hare@kernel.org>
> 
> nvme-auth: modify nvme_auth_transform_key() to return status
> 
> This commit changes nvme_auth_transform_key() to return the transformed key
> length or a negative error code and pass the allocated raw secret buffer via
> an output pointer, updating all callers in the NVMe host and target auth code.
> 
>> diff --git a/drivers/nvme/common/auth.c b/drivers/nvme/common/auth.c
>> index 1fdc4e4ed0b94..569f21ad4fc7e 100644
>> --- a/drivers/nvme/common/auth.c
>> +++ b/drivers/nvme/common/auth.c
>> @@ -317,37 +317,37 @@ static int nvme_auth_hash(u8 hmac_id, const u8 *data, size_t data_len, u8 *out)
>>   	return -EINVAL;
>>   }
>>   
>> -struct nvme_dhchap_key *nvme_auth_transform_key(
>> -		const struct nvme_dhchap_key *key, const char *nqn)
>> +int nvme_auth_transform_key(const struct nvme_dhchap_key *key, const char *nqn,
>> +			    u8 **transformed_secret)
>>   {
>>   	struct nvme_auth_hmac_ctx hmac;
>> -	struct nvme_dhchap_key *transformed_key;
>> -	int ret, key_len;
>> +	u8 *transformed_data;
>> +	u8 *key_data;
>> +	size_t transformed_len;
>> +	int ret;
> 
> [Severity: Low]
> Is transformed_data unused in this patch?  Declaring it here triggers a
> -Wunused-variable warning until later commit "nvme-auth: switch to use
> 'struct key'" uses it.
> 
Okay, will be removing it.

>>   
>>   	if (!key) {
>>   		pr_warn("No key specified\n");
>> -		return ERR_PTR(-ENOKEY);
>> +		return -ENOKEY;
>>   	}
>>   	if (key->hash == 0) {
>> -		key_len = nvme_auth_key_struct_size(key->len);
>> -		transformed_key = kmemdup(key, key_len, GFP_KERNEL);
>> -		if (!transformed_key)
>> -			return ERR_PTR(-ENOMEM);
>> -		return transformed_key;
>> +		key_data = kzalloc(key->len, GFP_KERNEL);
>> +		memcpy(key_data, key->key, key->len);
>> +		*transformed_secret = key_data;
>> +		return key->len;
>>   	}
> 
> [Severity: High]
> Can this cause a NULL pointer dereference in memcpy() if kzalloc() fails
> when key->hash == 0?  A later patch in the series, commit "nvme-auth: switch
> to use 'struct key'", adds a NULL check on key_data, but intermediate
> commits can crash here on allocation failure.
> 
Fixed up for the next version.

>>   	ret = nvme_auth_hmac_init(&hmac, key->hash, key->key, key->len);
>>   	if (ret)
>> -		return ERR_PTR(ret);
>> -	key_len = nvme_auth_hmac_hash_len(key->hash);
>> -	transformed_key = nvme_auth_alloc_key(key_len, key->hash);
>> -	if (!transformed_key) {
>> -		memzero_explicit(&hmac, sizeof(hmac));
>> -		return ERR_PTR(-ENOMEM);
>> -	}
>> +		return ret;
>> +	transformed_len = nvme_auth_hmac_hash_len(key->hash);
>> +	key_data = kzalloc(transformed_len, GFP_KERNEL);
>> +	if (!key_data)
>> +		return -ENOMEM;
> 
> [Severity: Low]
> Should this error path call memzero_explicit(&hmac, sizeof(hmac)) before
> returning -ENOMEM, as the code did prior to this patch so key-derived HMAC
> state is not left on the stack?
> 
Fixed up for the next version.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
