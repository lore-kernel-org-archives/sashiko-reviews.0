Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506932;
	b=XRw9YUx0kQjjnhGqdSHQQUIB3sQGcaIXKw4kAqutHGsz0J4k+Z+ZAZ8aX8KWAuo3Wr+n
	 1AfUcjOv4Rc6oSbTc+lN6iJ9KLzO5Z41g9bb/bgWOd75NbDzZTUwsPg0pMmNFSOnsO8VH
	 51fkpN1alyHPwCCALyd6xg42YNm8s1pTptrxQo4teA8mWWZ0r3pAotSIS9zDRdcy2HRqF
	 KtM1MhmwvsLo2HjscQy8GD65799fPCOG/iQCgotKWfEg4A1Fj88qBeASw1IkiRhXM87xD
	 EYq27SDeqwsQpx+wqNrpJw0JZlRLlrJTOA+kD5T2+rdR8xyFMUNOg08Ec5HMN3RfRJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506932;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Flag:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Score;
	bh=ylG3MbG7GnLFGRWEWi1SyH1cSeYiha97TTv92nQwSMY=;
	b=vBnpYTH1Cg27Xs7HWf24Yu/ijhXpfjioH0jzkfFVUEoWnw6U6kfQThw7igoSbjhlMnpO
	 iK9Xx8HQoAPvtR5BCPb9SWTIhi3QCPSg8PF2ck8j5M1EoaG9h4tZqByllbpkpfTaZB7KF
	 iaFBnoR3eYA1h42L0v3bcFuJ//i16IGCfYiUjrbl5nzWSupvjDX4K3kNuigNksjsDBVfM
	 4ZUSFmcC7/pokpyi1uTvRFZE5G6wb/Cgq90O6FLTmbQuf1wmiVUURxs07XTi11WEB1pN2
	 N877JfIUJMco7fYLWNEYlnYlRuQHSORS3qMxAhron2mVVk7NLSG2UMGroL6atg/+PUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Bmy5EudU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SYv7VJJR;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Bmy5EudU;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SYv7VJJR;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F546606A322
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 07:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F546606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Bmy5EudU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SYv7VJJR;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Bmy5EudU;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SYv7VJJR
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C276722263;
	Tue, 24 Nov 2026 07:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795506929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ylG3MbG7GnLFGRWEWi1SyH1cSeYiha97TTv92nQwSMY=;
	b=Bmy5EudUa6q+RXSGXVShulWZWdGjxu9SKZLRxUVRa+w3mq31sBo5uBGXyY7BHQRpFZmaFq
	ypgEsQlNWOMAeMNlyAy/U+izta5mc3kEG5rg2LbcchdYja5eiN6b3uopSb3z/IEW8dByK/
	P6n+a2DF3l3wcNVJvN+YCFGuHAXgXGs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795506929;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ylG3MbG7GnLFGRWEWi1SyH1cSeYiha97TTv92nQwSMY=;
	b=SYv7VJJR9JLtb4sB880cqf/5t1R/1FkI2PP5vZusuKRLrdo3HI4GzrDcy19+HgGLvTOX6g
	Y2cQi4EffArl2QCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795506929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ylG3MbG7GnLFGRWEWi1SyH1cSeYiha97TTv92nQwSMY=;
	b=Bmy5EudUa6q+RXSGXVShulWZWdGjxu9SKZLRxUVRa+w3mq31sBo5uBGXyY7BHQRpFZmaFq
	ypgEsQlNWOMAeMNlyAy/U+izta5mc3kEG5rg2LbcchdYja5eiN6b3uopSb3z/IEW8dByK/
	P6n+a2DF3l3wcNVJvN+YCFGuHAXgXGs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795506929;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ylG3MbG7GnLFGRWEWi1SyH1cSeYiha97TTv92nQwSMY=;
	b=SYv7VJJR9JLtb4sB880cqf/5t1R/1FkI2PP5vZusuKRLrdo3HI4GzrDcy19+HgGLvTOX6g
	Y2cQi4EffArl2QCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 843411339F;
	Tue, 24 Nov 2026 07:55:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dkL8FvFCBWt4aQAAD6G6ig
	(envelope-from <hare@suse.de>); Tue, 24 Nov 2026 07:55:29 +0000
Message-ID: <c429a65b-d027-4612-85d6-3a42a37900b3@suse.de>
Date: Tue, 24 Nov 2026 08:55:24 +0100
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
Subject: Re: [PATCH v6 5/9] nvmet-auth: parse dhchap key from configfs
 attribute
To: sashiko-reviews@lists.linux.dev, Hannes Reinecke <hare@kernel.org>
Cc: linux-nvme@lists.infradead.org
References: <20261123-dhchap-keyring-v4-v6-0-5082a49715ab@kernel.org>
 <20261123-dhchap-keyring-v4-v6-5-5082a49715ab@kernel.org>
 <sashiko-outbox-229749@kernel.org>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <sashiko-outbox-229749@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-13.29 / 50.00];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Score: -13.29

On 11/23/26 6:30 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] nvmet-auth: host_key reference leak in nvmet_setup_auth() on
>    ctrl_key error
> --
> 
> commit 0056af1c2f2c7d56f3cbd59406150e77070f9ffe
> Author: Hannes Reinecke <hare@kernel.org>
> 
> nvmet-auth: parse dhchap key from configfs attribute
> 
> This commit converts the nvmet configfs DH-HMAC-CHAP key handling to
> parse and store keys as struct key references on struct nvmet_host
> instead of raw secret strings.
> 
>> diff --git a/drivers/nvme/target/auth.c b/drivers/nvme/target/auth.c
>> index 26457ce4acc2a..6348c810bd168 100644
>> --- a/drivers/nvme/target/auth.c
>> +++ b/drivers/nvme/target/auth.c
> 
> [ ... ]
> 
>> @@ -186,22 +195,43 @@ u8 nvmet_setup_auth(struct nvmet_ctrl *ctrl, struct nvmet_sq *sq, bool reset)
>>   		goto out_unlock;
>>   	}
>>   
>> -	if (!host->dhchap_secret) {
>> +	if (!host->dhchap_key) {
>>   		pr_debug("No authentication provided\n");
>>   		goto out_unlock;
>>   	}
>>   
>> -	host_key = nvme_auth_extract_key(NULL, host->dhchap_secret,
>> -					 strlen(host->dhchap_secret));
>> -	if (IS_ERR(host_key)) {
>> +	host_key = key_get(host->dhchap_key);
>> +	if (!host_key) {
>> +		pr_warn("%s: host key %08x not found\n",
>> +			__func__, key_serial(host->dhchap_key));
>>   		ret = NVME_AUTH_DHCHAP_FAILURE_NOT_USABLE;
>>   		goto out_unlock;
>>   	}
>> -	if (host->dhchap_ctrl_secret) {
>> -		ctrl_key = nvme_auth_extract_key(NULL, host->dhchap_ctrl_secret,
>> -						 strlen(host->dhchap_ctrl_secret));
>> -		if (IS_ERR(ctrl_key)) {
>> -			key_put(host_key);
>> +	down_read(&host_key->sem);
>> +	ret = key_validate(host_key);
>> +	key_id = key_serial(host_key);
>> +	up_read(&host_key->sem);
>> +	if (ret) {
>> +		pr_warn("host key %08x invalidated\n", key_id);
>> +		key_put(host_key);
>> +		ret = NVME_AUTH_DHCHAP_FAILURE_NOT_USABLE;
>> +		goto out_unlock;
>> +	}
>> +	if (host->dhchap_ctrl_key) {
>> +		ctrl_key = key_get(host->dhchap_ctrl_key);
>> +		if (!ctrl_key) {
>> +			pr_warn("%s: ctrl key %08x not found\n",
>> +				__func__, key_serial(host->dhchap_ctrl_key));
>> +			ret = NVME_AUTH_DHCHAP_FAILURE_NOT_USABLE;
>> +			goto out_unlock;
>> +		}
>> +		down_read(&ctrl_key->sem);
>> +		ret = key_validate(ctrl_key);
>> +		key_id = key_serial(ctrl_key);
>> +		up_read(&ctrl_key->sem);
>> +		if (ret) {
>> +			pr_warn("ctrl key %08x invalidated\n", key_id);
>> +			key_put(ctrl_key);
>>   			ret = NVME_AUTH_DHCHAP_FAILURE_NOT_USABLE;
>>   			goto out_unlock;
>>   		}
> 
> [Severity: Medium]
> Do both error paths under if (host->dhchap_ctrl_key) leak host_key by
> jumping to out_unlock without calling key_put(host_key)?
> 
Fixed with the next version.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
