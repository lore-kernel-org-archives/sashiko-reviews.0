Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506709;
	b=j6bHHIzVxRMXtvNRW/w/TpgU2ZQ+e/xQF7eDHg/c1lHd68knU8GSZcPXxvRWBLcM2PD4
	 BFpliNYxYk7cbCBoQltFywYY4beTymHgGW3NXOJdHHe3uwarObR4CFFHYI7FiCJOc7bXy
	 1hyUs4u8v7rHHBuq29WOva/vv9s1YY9F328cplHxkPmSo3TA19923r8aosDh3aIHwvfZ9
	 adlHHR6QhP35lDQEpS9XiTgLg6jl5kZPtz6kiEWeESZAVA8A/LeFJnkiGm8KCIkGoSz1S
	 cKF9yh7LOld1f+NK6U/oRu0LwUiOm7UqrVOW3JgXV89cnipjeDwPH6+pEr6BMWqxBUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506709;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Spamd-Result:X-Rspamd-Server:
	 X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=csZGYarPDZxv0YFnn4tvfoIVpHNzlHya2plzdg48FB4=;
	b=mqf1Ly/vtbp/muj3N+DXc/r47dUak7dYGYKji8uY8r2vdszcIPOGHPQDJXUPCELrCqJv
	 xWZ67vVDqN+K981g4hPYS/fGn3Zr77azwHoYSZsPHWr2DgshLv4uT5vg2Oy+nDA9YVmoN
	 BUMRxMlNqFhXZ34GOF7WIP0lQdVPxmaQGUKPRfXdHd0Hobo5jn47468R74JyQKhCsLiuE
	 d1/ykhZ/pPRBrLAqQfaqKFUKTZ+edI9hiEkpDx2qiiA5PJhOvxFx14Hzxg4Gdk0UEa6Tm
	 JQf6c8vTw9D92++cc67U278MirRCV1a4hOCoscLefhPQtilLE4P7NG3C5UlJbL5P70Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ecadd82s;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="hEraFxA/";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vT3MPFog;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HmBSUjYA;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF016606A31E
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 07:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF016606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ecadd82s;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hEraFxA/;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vT3MPFog;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HmBSUjYA
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DB9651FC86;
	Tue, 24 Nov 2026 07:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795506707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=csZGYarPDZxv0YFnn4tvfoIVpHNzlHya2plzdg48FB4=;
	b=ecadd82sUdNT3OkNqoeyS4rVVeWRnkx5SY6KrTrArurjpnvoyL0SIG9EA04KyW9jBkvyEi
	kL6bhnqUS/p/yQEr+/W0Jia/e5FaktYPz8dEkDo53TTmCb12INaexIv05naj3FJUbn+uSm
	B23Eqwmg2c/ZIG8f+sRFYz6Mrmx5j10=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795506707;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=csZGYarPDZxv0YFnn4tvfoIVpHNzlHya2plzdg48FB4=;
	b=hEraFxA/4B3exs9yNJ0R/BFkkKu9++X3hhrmBZx2D9H0OJyh9w1KlL8zKLAUwu0ztCng24
	OZBO9ol6FRT4CsCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vT3MPFog;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HmBSUjYA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795506706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=csZGYarPDZxv0YFnn4tvfoIVpHNzlHya2plzdg48FB4=;
	b=vT3MPFogo3OZY1VE+CipoCKHcbLflcHz8NKf/vCPS/iNpr4EiVrKSGtb2Kay99MxqbDKym
	2o3byK0xLDmepgBdZJ1Ci+y4A/8j2zsl3ZyjARqrY7L7N/dk43QbG8cTOQlfaFH1QPjItS
	AwMJX06lGr4bDbutGeC3PEQ51E26x/k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795506706;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=csZGYarPDZxv0YFnn4tvfoIVpHNzlHya2plzdg48FB4=;
	b=HmBSUjYALudrplReBms2V94VLdOglRRRqct6Qyxn9ju7xkcAPmWcX9hBnTIb84U652XY+G
	XdtxDAvPyUGnq4DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 73A671339F;
	Tue, 24 Nov 2026 07:51:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PyxPEhJCBWtgZgAAD6G6ig
	(envelope-from <hare@suse.de>); Tue, 24 Nov 2026 07:51:46 +0000
Message-ID: <05870323-35ff-4941-a2be-dcc99c12b8c5@suse.de>
Date: Tue, 24 Nov 2026 08:51:41 +0100
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
Subject: Re: [PATCH v6 4/9] nvme: parse dhchap keys during option parsing
To: sashiko-reviews@lists.linux.dev, Hannes Reinecke <hare@kernel.org>
Cc: linux-nvme@lists.infradead.org
References: <20261123-dhchap-keyring-v4-v6-0-5082a49715ab@kernel.org>
 <20261123-dhchap-keyring-v4-v6-4-5082a49715ab@kernel.org>
 <sashiko-outbox-229738@kernel.org>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <sashiko-outbox-229738@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -13.50
X-Spam-Level: 
X-Rspamd-Queue-Id: DB9651FC86

On 11/23/26 6:26 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Low] nvme: dhchap_key_show() and dhchap_ctrl_key_show() return 0
>    instead of none
> - [Low] nvme-auth: log of unassigned ctrl->host_key in
>    nvme_auth_init_ctrl()
> --
> 
> commit bfaa9fb3c74e5de5eb5e03ecba9893bb438923f7
> Author: Hannes Reinecke <hare@kernel.org>
> 
> nvme: parse dhchap keys during option parsing
> 
> This commit creates DH-HMAC-CHAP keys during fabric option parsing to store
> struct key pointers instead of plain text secrets in nvmf_ctrl_options, and
> adds dhchap_key and dhchap_ctrl_key sysfs attributes exposing their key
> serial numbers.
> 
>> diff --git a/drivers/nvme/host/auth.c b/drivers/nvme/host/auth.c
>> index 0ddf3834f4ea2..26e8f321650e7 100644
>> --- a/drivers/nvme/host/auth.c
>> +++ b/drivers/nvme/host/auth.c
> [ ... ]
>> @@ -1029,40 +1024,100 @@ static void nvme_ctrl_auth_work(struct work_struct *work)
> [ ... ]
>> +	pr_debug("%s: using dhchap host key %08x\n",
>> +	       __func__, key_serial(ctrl->host_key));
>> +	if (ctrl->host_key)
>> +		nvme_auth_clear_host_key(ctrl);
>> +	ctrl->host_key = host_key;
> 
> [Severity: Low]
> Should this pr_debug() pass key_serial(host_key) instead of
> key_serial(ctrl->host_key)?  Because ctrl->host_key has not been assigned
> yet, it logs 00000000 instead of the new key serial.
> 
Fixed with the next version.

>> diff --git a/drivers/nvme/host/sysfs.c b/drivers/nvme/host/sysfs.c
>> index a5c1511e49ac2..6fab0d217e749 100644
>> --- a/drivers/nvme/host/sysfs.c
>> +++ b/drivers/nvme/host/sysfs.c
> [ ... ]
>> @@ -925,6 +985,52 @@ static ssize_t dhchap_ctrl_secret_store(struct device *dev,
>>   
>>   static DEVICE_ATTR_ADMIN_RW(dhchap_ctrl_secret);
>> +
>> +static ssize_t dhchap_key_show(struct device *dev,
>> +		struct device_attribute *attr, char *buf)
>> +{
>> +	struct nvme_ctrl *ctrl = dev_get_drvdata(dev);
>> +	struct key *key;
>> +	ssize_t count = 0;
>> +
>> +	mutex_lock(&ctrl->dhchap_auth_mutex);
>> +	key = ctrl->host_key;
>> +	if (key) {
>> +		down_read(&key->sem);
>> +		if (key_validate(key))
>> +			count = sysfs_emit(buf, "<invalidated>\n");
>> +		else
>> +			count = sysfs_emit(buf, "%08x\n",
>> +					   key_serial(key));
>> +		up_read(&key->sem);
>> +	}
>> +	mutex_unlock(&ctrl->dhchap_auth_mutex);
>> +	return count;
>> +}
>> +static DEVICE_ATTR_ADMIN_RO(dhchap_key);
>> +
>> +static ssize_t dhchap_ctrl_key_show(struct device *dev,
>> +		struct device_attribute *attr, char *buf)
>> +{
>> +	struct nvme_ctrl *ctrl = dev_get_drvdata(dev);
>> +	struct key *key;
>> +	ssize_t count = 0;
>> +
>> +	mutex_lock(&ctrl->dhchap_auth_mutex);
>> +	key = ctrl->ctrl_key;
>> +	if (key) {
>> +		down_read(&key->sem);
>> +		if (key_validate(key))
>> +			count = sysfs_emit(buf, "<invalidated>\n");
>> +		else
>> +			count = sysfs_emit(buf, "%08x\n",
>> +					   key_serial(key));
>> +		up_read(&key->sem);
>> +	}
>> +	mutex_unlock(&ctrl->dhchap_auth_mutex);
>> +	return count;
>> +}
>> +static DEVICE_ATTR_ADMIN_RO(dhchap_ctrl_key);
> 
> [Severity: Low]
> Should dhchap_key_show() and dhchap_ctrl_key_show() emit "none\n" when key
> is NULL?  The Documentation/ABI/stable/sysfs-nvme entry added in this patch
> states that reading dhchap_key and dhchap_ctrl_key returns "none" if not
> set, matching dhchap_secret_show() and dhchap_ctrl_secret_show(), but both
> functions currently return 0 (empty output).
> 
Fixed for the next version.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
