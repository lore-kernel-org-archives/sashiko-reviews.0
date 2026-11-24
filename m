Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506218;
	b=BPRkdFurfNNmC7Q5EnzuZsb93jbV8QKlKH8iBjk0efeD8pJfdac4ZxQKAawjnqW2fOKw
	 EL+SBzvQW7MO2gJ5ESr6x3xf5INztuwdYzlaRp7QJa7yWFH0ixtnXhH7BtiFGyxgBLQrb
	 jL1UFx1tOT90sgRBBpjV8mEqx/yGRtXx7VuSpr5pm9iq7wqO90K+ImnScDZt2ZCY/gFih
	 RItY5rkErHDidpoXfeI0o9N6lHjcxNDWX7fWg5AdFiKl7tCSdu7HJCeMkJdKokODTVpcd
	 BXM3qAUyUnQhoLiB9+MO2VadkuT73+CDbGPcCGInJG9kXYrnKUesb+vrKCi4BfvyPFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506218;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:
	 X-Spam-Score;
	bh=BPRfZwZwjMXbFx5J4x9Wa/ppeoKt/aqhw8xuTUf93u4=;
	b=MQXPlWLddnCnekRK0SaS24MdIMRQn455ytDovOvR0PuOPxqzg552/BOUYjdUXzgldi0I
	 x2jd8qORPKY4lmlq3NO82WK6NhH+AUnIfQvdVuEi2kYHo9Nx8uqqPdEsmpXT8gjOMJpT+
	 By5Bq/dRkwZcfh2HvTE291tpnVzRdmPeJg1vC22PFBicuNfxlTO7lH8Lyzz5wGqw/KW/c
	 sfEyJk9yBGCiNxXmY6qQKeG0OHZwPGOPn0/HiGPL5Ql/bBDANCMEaBUL8f3d3WAOl4c97
	 7VswqBL+21UFXsag0v9XfD4RQ8L+Zm5Czk/cyulPFD+Ktc7g6RzK/JDsSlavdSm1W0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VGEELEHA;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YGNbWBbD;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VGEELEHA;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YGNbWBbD;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A248606A321
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 07:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A248606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VGEELEHA;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YGNbWBbD;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VGEELEHA;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YGNbWBbD
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8CE69221A5;
	Tue, 24 Nov 2026 07:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795506215; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BPRfZwZwjMXbFx5J4x9Wa/ppeoKt/aqhw8xuTUf93u4=;
	b=VGEELEHAfHYqWtQ+VIAJyJn6NO5mgIQ9TeNqumIHOtLf8wPvie8lEpT7E4Ow7leB/Dp3DU
	zuTt+I+rg/wvAY7C6vfMOzgsZaEXK8dYmFJVx0ozaqlVTT7SMrjezIH8/AZE3zRJ0KYCCe
	84qXQb8MfVqn/JVoXOw89hvWIxQKapA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795506215;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BPRfZwZwjMXbFx5J4x9Wa/ppeoKt/aqhw8xuTUf93u4=;
	b=YGNbWBbDivmI0QXOndl5HmPgtkItaeIqpv6FWm7+jmYjeRlf081vhn8xM0y3vJ3X/VPjH1
	qklS7qTIl5IspHDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VGEELEHA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YGNbWBbD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795506215; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BPRfZwZwjMXbFx5J4x9Wa/ppeoKt/aqhw8xuTUf93u4=;
	b=VGEELEHAfHYqWtQ+VIAJyJn6NO5mgIQ9TeNqumIHOtLf8wPvie8lEpT7E4Ow7leB/Dp3DU
	zuTt+I+rg/wvAY7C6vfMOzgsZaEXK8dYmFJVx0ozaqlVTT7SMrjezIH8/AZE3zRJ0KYCCe
	84qXQb8MfVqn/JVoXOw89hvWIxQKapA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795506215;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BPRfZwZwjMXbFx5J4x9Wa/ppeoKt/aqhw8xuTUf93u4=;
	b=YGNbWBbDivmI0QXOndl5HmPgtkItaeIqpv6FWm7+jmYjeRlf081vhn8xM0y3vJ3X/VPjH1
	qklS7qTIl5IspHDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 26A8F1339F;
	Tue, 24 Nov 2026 07:43:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id A7PdOiZABWvIXQAAD6G6ig
	(envelope-from <hare@suse.de>); Tue, 24 Nov 2026 07:43:35 +0000
Message-ID: <8a1c7f60-1966-4454-8a69-4dfa208cfd27@suse.de>
Date: Tue, 24 Nov 2026 08:43:34 +0100
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
Subject: Re: [PATCH v6 3/9] nvme-auth: switch to use 'struct key'
To: sashiko-reviews@lists.linux.dev, Hannes Reinecke <hare@kernel.org>
Cc: linux-nvme@lists.infradead.org
References: <20261123-dhchap-keyring-v4-v6-0-5082a49715ab@kernel.org>
 <20261123-dhchap-keyring-v4-v6-3-5082a49715ab@kernel.org>
 <sashiko-outbox-229762@kernel.org>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <sashiko-outbox-229762@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8CE69221A5
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-13.50 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -13.50

On 11/23/26 6:32 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] nvme-auth: memory leak of transformed_data in
>    nvme_auth_transform_key()
> --
> 
> commit 4697c9583f14fbc14890cc4dbfaed8c9987d382a
> Author: Hannes Reinecke <hare@kernel.org>
> 
> nvme-auth: switch to use 'struct key'
> 
> This commit switches NVMe DH-HMAC-CHAP key storage and handling from
> struct nvme_dhchap_key to struct key using the dhchap key type.
> 
>> diff --git a/drivers/nvme/common/auth.c b/drivers/nvme/common/auth.c
>> index 308af3d7c7383..158c9cb886c15 100644
>> --- a/drivers/nvme/common/auth.c
>> +++ b/drivers/nvme/common/auth.c
> [ ... ]
>> @@ -317,11 +261,13 @@ static int nvme_auth_hash(u8 hmac_id, const u8 *data, size_t data_len, u8 *out)
>>   	return -EINVAL;
>>   }
>>   
>> -int nvme_auth_transform_key(const struct nvme_dhchap_key *key, const char *nqn,
>> +int nvme_auth_transform_key(struct key *key, const char *nqn,
>>   			    u8 **transformed_secret)
>>   {
> [ ... ]
>> +	transformed_len = nvme_auth_hmac_hash_len(key_hash);
>> +	transformed_data = kzalloc(transformed_len, GFP_KERNEL);
>> +	if (!transformed_data) {
>> +		ret = -ENOMEM;
>> +		goto out_free_data;
>> +	}
>> +
>> +	ret = nvme_auth_hmac_init(&hmac, key_hash, key_data, key_len);
>> +	if (ret)
>> +		goto out_free_data;
>>   	nvme_auth_hmac_update(&hmac, nqn, strlen(nqn));
>>   	nvme_auth_hmac_update(&hmac, "NVMe-over-Fabrics", 17);
>> -	nvme_auth_hmac_final(&hmac, key_data);
>> -	*transformed_secret = key_data;
>> -	return transformed_len;
>> +	nvme_auth_hmac_final(&hmac, transformed_data);
>> +	*transformed_secret = transformed_data;
>> +	ret = transformed_len;
>> +out_free_data:
>> +	kfree_sensitive(key_data);
>> +	return ret;
>>   }
> 
> [Severity: Medium]
> Does this leak transformed_data when nvme_auth_hmac_init() fails and jumps
> to out_free_data?
> 
Fixed with the next version.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
