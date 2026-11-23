Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447559;
	b=eqhkyBLzjkwlioorPeStDiasB8gZl6+Vwy5eU4zSGHmIfIZEwi+lUI0syaPoluI9teRv
	 VJL3Y+FLjMqbxgaOcFqkfAHzp8RrzvNb4Fe9xo3kVWiLKyrdCcle4/WIcxv7LzWfGC80/
	 xGt6K+Bgo4YK5AmNCfXdzewvYe+2V0zMw5mYzJSWl7a1DCeFk7zbrsSUPFMCSOEU6ZTiJ
	 XnBnGfkZ1dWGHAHB5Tr93/wHL6l8x1pV9M+smcDB9Jypnf26JCCwzvXRWwo/IqLtQlFDN
	 t4m38gLHVqX9jEjQ8d9FORB46vg/ZhG3zibz3MEOiXk5Hulb1jWkJVmA6EhtmIJ4erw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447559;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Spamd-Result:X-Spam-Score:
	 X-Spam-Level:X-Spam-Flag;
	bh=I0C8pCAjPter7UPpAGvtPhfrUpngzV6dZH5UNzHRGbs=;
	b=j+B0dcAYurKMzn7uOw6u+Z29lBicB97qaOQlMyO/eaiyZ23Aw63KdJbORjjGAbV8J3+U
	 6DxtmyYqlVq2EDz15crr6zSs4hs5zs3P4YWJ4OCDyRKu1z3zGRt4fJ5h2DT5OgDimJXxT
	 sFxQtzjUrxSGpM+RbATdYyi4u4OeEPq/0wRT3985+lT3yF2rnGHsKGttuKnSukrjadwoT
	 bPHqlQBPyHveJ5g5PpZ6PmfojBM1xHxHUjkj8hwo6c5f5o+8CB80tMbBOqJjjxuRuGgcA
	 t/1ujYpctm62fqcSXXSiZkCRKj+t2H2/Ha30Gpq7QlUFFdRH0ynMhBUmJw9MLqwGckQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jlLH6fcj;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mysT0KrP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jlLH6fcj;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mysT0KrP;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41929606A31F
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 15:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41929606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jlLH6fcj;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mysT0KrP;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jlLH6fcj;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mysT0KrP
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2FD001F850;
	Mon, 23 Nov 2026 15:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795447556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I0C8pCAjPter7UPpAGvtPhfrUpngzV6dZH5UNzHRGbs=;
	b=jlLH6fcjfyXs8mM2kU66IsNbb4zAGeKF5lWaOOJ/wQ3KhEa6VYQjwxYtyEHoiFAf1s0nWn
	3WvJaLdrh6d0tC9f3OyXjjZSzHJktt6R81da2Oj0axyaEARsgPG0jUdwUJjqjRRpXOoPP4
	6qQkLJ95VkGDSwboTp+nMgNPr6kP9T4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795447556;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I0C8pCAjPter7UPpAGvtPhfrUpngzV6dZH5UNzHRGbs=;
	b=mysT0KrPEFy1ITNfxAatghiD/WAP1e4jIcmX6Mzx++L1nokTta1qcYfdI9DI9IrTSDFmWd
	jI1sJN5wjrWYy2BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795447556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I0C8pCAjPter7UPpAGvtPhfrUpngzV6dZH5UNzHRGbs=;
	b=jlLH6fcjfyXs8mM2kU66IsNbb4zAGeKF5lWaOOJ/wQ3KhEa6VYQjwxYtyEHoiFAf1s0nWn
	3WvJaLdrh6d0tC9f3OyXjjZSzHJktt6R81da2Oj0axyaEARsgPG0jUdwUJjqjRRpXOoPP4
	6qQkLJ95VkGDSwboTp+nMgNPr6kP9T4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795447556;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I0C8pCAjPter7UPpAGvtPhfrUpngzV6dZH5UNzHRGbs=;
	b=mysT0KrPEFy1ITNfxAatghiD/WAP1e4jIcmX6Mzx++L1nokTta1qcYfdI9DI9IrTSDFmWd
	jI1sJN5wjrWYy2BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ECD0B13510;
	Mon, 23 Nov 2026 15:25:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id p+wzMgNbBGtZFwAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 23 Nov 2026 15:25:55 +0000
Message-ID: <d5cf54d1-5032-432d-8bcc-49ce0fc212b0@suse.de>
Date: Mon, 23 Nov 2026 16:25:55 +0100
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
Subject: Re: [PATCH v5 6/9] nvme: allow to pass in key description as dhchap
 secret
To: sashiko-reviews@lists.linux.dev, Hannes Reinecke <hare@kernel.org>
Cc: linux-nvme@lists.infradead.org
References: <20261123-dhchap-keyring-v4-v5-0-81eefb4c0724@kernel.org>
 <20261123-dhchap-keyring-v4-v5-6-81eefb4c0724@kernel.org>
 <sashiko-outbox-229231@kernel.org>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <sashiko-outbox-229231@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-13.29 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-0.996];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Score: -13.29
X-Spam-Level: 
X-Spam-Flag: NO

On 11/23/26 1:36 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 10 potential
> issues to consider:
> - [High] nvmet-auth: NULL pointer dereference in nvmet_auth_set_key()
>    when clearing key
> - [High] nvme-keyring: broken !CONFIG_NVME_KEYRING stubs in
>    include/linux/nvme-keyring.h
> - [Medium] nvme: broken key visibility check in
>    nvme_dev_attrs_are_visible()
> - [Medium] nvme-auth: self-revocation when updating key with active key
>    description
> - [Medium] nvmet: off-by-one PAGE_SIZE overflow via sprintf() in dhchap
>    key configfs show
> - [Medium] nvme-auth: unnecessary synchronize_rcu() stalls after
>    key_revoke() under locks
> - [Low] nvme-auth: mismatched key serial docs and prototype in
>    nvme_auth_extract_key()
> - [Low] nvme-auth: key_serial() logged before key assignment in
>    nvme_auth_init_ctrl()
> - [Low] nvme-sysfs: missing trailing newline on invalidated in
>    dhchap_ctrl_secret_show()
> - [Low] nvme-auth: nvme_auth_init_ctrl() logs key_serial() before
>    assigning ctrl keys
> --
> 
> commit 4ce0c96fc574d457ee6098926055522bf6b8f799
> Author: Hannes Reinecke <hare@kernel.org>
> 
> nvme: allow to pass in key description as dhchap secret
> 
> This commit updates nvme_auth_extract_key() to look up a pre-populated
> DH-HMAC-CHAP key in the keyring before falling back to generating a key
> from raw secret data, and tracks whether the key was auto-generated so
> only generated keys are revoked on teardown.
> 
>> diff --git a/drivers/nvme/common/auth.c b/drivers/nvme/common/auth.c
>> index ee26fb416ee62..abdad41daa8fb 100644
>> --- a/drivers/nvme/common/auth.c
>> +++ b/drivers/nvme/common/auth.c
>> @@ -144,20 +144,32 @@ EXPORT_SYMBOL_GPL(nvme_auth_hmac_hash_len);
>>    * nvme_auth_extract_key - extract the DH-HMAC-CHAP key
>>    *
>>    * @keyring: keyring to be used for the resulting key
>> - * @secret: key data
>> - * @secret_len: length of @secret
>> + * @input: key serial or key data
>> + * @input_len: length of @input
>> + * @generated: indicate whether a key has been generated
>>    *
>> - * Extracts a dhchap key from @secret.
>> + * Extracts or generates a key from @input.
>> + * @input can either be a key serial or raw key data; in
>> + * the latter case a key is generated from @input and
>> + * @generated is set to 'true'.
>>    *
>>    * Returns the dhchap key or an error pointer on failure.
>>    */
>> -struct key *nvme_auth_extract_key(struct key *keyring, const char *secret,
>> -				  size_t secret_len)
>> +struct key *nvme_auth_extract_key(struct key *keyring, const char *input,
>> +				  size_t input_len, bool *generated)
>>   {
>>   	struct key *key;
>>   
>> -	key = nvme_dhchap_psk_create(keyring, secret, secret_len);
>> +	/* Check if @input is a key serial number */
>> +	key = nvme_dhchap_psk_lookup(keyring, input);
> 
> [Severity: Low]
> This isn't a bug, but the commit message body, kernel-doc and inline
> comment refer to @input as a key serial number, whereas
> nvme_dhchap_psk_lookup() searches the keyring by key description
> (key->description).
> 
Yes, that is why I put the comment in to indicate that we first
try to check if 'input' is a key serial number.

>> diff --git a/drivers/nvme/host/auth.c b/drivers/nvme/host/auth.c
>> index 535cc433dd35d..98913eaeb6d68 100644
>> --- a/drivers/nvme/host/auth.c
>> +++ b/drivers/nvme/host/auth.c
> [ ... ]
>> @@ -1109,6 +1122,7 @@ int nvme_auth_init_ctrl(struct nvme_ctrl *ctrl)
>>   	if (ctrl->host_key)
>>   		nvme_auth_clear_host_key(ctrl);
>>   	ctrl->host_key = host_key;
>> +	ctrl->host_key_generated = host_key_generated;
> 
> [Severity: Low]
> Just above this in nvme_auth_init_ctrl(), dev_dbg() logs
> key_serial(ctrl->host_key) before ctrl->host_key = host_key is assigned:
> 
> drivers/nvme/host/auth.c:nvme_auth_init_ctrl() {
> 	...
> 	dev_dbg(ctrl->device,
> 		"%s: using dhchap host key %08x\n",
> 		__func__, key_serial(ctrl->host_key));
> 	if (ctrl->host_key)
> 		nvme_auth_clear_host_key(ctrl);
> 	ctrl->host_key = host_key;
> 	...
> }
> 
> Should that log key_serial(host_key) instead so it does not print 00000000
> (or the previous key's serial on reset)?
> 
>>   	if (ctrl->ctrl_key)
>>   		nvme_auth_clear_ctrl_key(ctrl);
>> @@ -1117,6 +1131,7 @@ int nvme_auth_init_ctrl(struct nvme_ctrl *ctrl)
>>   			"%s: using dhchap ctrl key %08x\n",
>>   			__func__, key_serial(ctrl->ctrl_key));
>>   		ctrl->ctrl_key = ctrl_key;
>> +		ctrl->ctrl_key_generated = ctrl_key_generated;
>>   	}
> 
> [Severity: Low]
> Similarly, nvme_auth_clear_ctrl_key(ctrl) clears ctrl->ctrl_key to NULL
> right before dev_dbg() logs key_serial(ctrl->ctrl_key), so this always
> prints 00000000 instead of key_serial(ctrl_key).
> 

Fixed with the next version.

>> diff --git a/drivers/nvme/host/fabrics.c b/drivers/nvme/host/fabrics.c
>> index 0c09888be31f7..1277749c6e2e3 100644
>> --- a/drivers/nvme/host/fabrics.c
>> +++ b/drivers/nvme/host/fabrics.c
> [ ... ]
>> @@ -1339,15 +1343,25 @@ void nvmf_free_options(struct nvmf_ctrl_options *opts)
>>   	kfree(opts->host_traddr);
>>   	kfree(opts->host_iface);
>>   	if (opts->dhchap_key) {
>> -		pr_debug("revoke dhchap host key %08x\n",
>> +		if (opts->dhchap_key_generated) {
>> +			pr_debug("revoke dhchap host key %08x\n",
>> +				 key_serial(opts->dhchap_key));
>> +			key_revoke(opts->dhchap_key);
>> +			synchronize_rcu();
>> +		}
>> +		pr_debug("drop dhchap host key %08x\n",
>>   			 key_serial(opts->dhchap_key));
>> -		key_revoke(opts->dhchap_key);
>>   		key_put(opts->dhchap_key);
>>   	}
>>   	if (opts->dhchap_ctrl_key) {
>> -		pr_debug("revoke dhchap ctrl key %08x\n",
>> +		if (opts->dhchap_ctrl_key_generated) {
>> +			pr_debug("revoke dhchap ctrl key %08x\n",
>> +				 key_serial(opts->dhchap_ctrl_key));
>> +			key_revoke(opts->dhchap_ctrl_key);
>> +			synchronize_rcu();
>> +		}
>> +		pr_debug("drop dhchap ctrl key %08x\n",
>>   			 key_serial(opts->dhchap_ctrl_key));
>> -		key_revoke(opts->dhchap_ctrl_key);
>>   		key_put(opts->dhchap_ctrl_key);
>>   	}
>>   	kfree(opts);
> 
> [Severity: Medium]
> Why call synchronize_rcu() after key_revoke() here, in
> dhchap_secret_store(), dhchap_ctrl_secret_store() and
> nvmet_auth_revoke_key()?
> 
> key_revoke() sets KEY_FLAG_REVOKED under key->sem and schedules payload
> destruction via call_rcu(), while all DH-HMAC-CHAP key readers serialize
> on key->sem and key_validate().  Waiting synchronously for an RCU grace
> period stalls callers unnecessarily, including while holding
> ctrl->dhchap_auth_mutex in dhchap_[ctrl_]secret_store() and while holding
> down_write(&nvmet_config_sem) in nvmet_auth_set_key(), which blocks all
> concurrent target connections and configfs operations.
> 

Okay, dropped the call to synchronize_rcu() for the next version.

>> diff --git a/drivers/nvme/host/sysfs.c b/drivers/nvme/host/sysfs.c
>> index e73c3ad89adc0..e6d42da84e168 100644
>> --- a/drivers/nvme/host/sysfs.c
>> +++ b/drivers/nvme/host/sysfs.c
> [ ... ]
>> @@ -875,19 +878,25 @@ static ssize_t dhchap_secret_store(struct device *dev,
>>   	up_read(&key->sem);
>>   	if (ret) {
>>   		dev_warn(ctrl->dev, "key %08x invalidated\n", key_serial(key));
>> -		dev_dbg(ctrl->dev, "revoke host key %08x\n", key_serial(key));
>> -		key_revoke(key);
>> +		if (generated) {
>> +			dev_dbg(ctrl->dev, "revoke host key %08x\n", key_serial(key));
>> +			key_revoke(key);
>> +			synchronize_rcu();
>> +		}
>>   		key_put(key);
>>   		kfree_sensitive(dhchap_secret);
>>   		return ret;
>>   	}
>>   	mutex_lock(&ctrl->dhchap_auth_mutex);
>>   	old_key = ctrl->host_key;
>> -	dev_dbg(ctrl->dev, "revoke host key %08x\n",
>> -		key_serial(old_key));
>> -	key_revoke(old_key);
>> -
>> +	if (ctrl->host_key_generated) {
>> +		dev_dbg(ctrl->dev, "revoke host key %08x\n",
>> +			key_serial(old_key));
>> +		key_revoke(old_key);
>> +		synchronize_rcu();
>> +	}
>>   	ctrl->host_key = key;
>> +	ctrl->host_key_generated = generated;
>>   	mutex_unlock(&ctrl->dhchap_auth_mutex);
> 
> [Severity: Medium]
> Can this revoke the newly selected key when the active key was
> auto-generated?
> 
> An auto-generated key is linked into the keyring with a UUID description.
> If a user writes that active key's description to dhchap_secret_store()
> (or dhchap_ctrl_secret_store(), or nvmet_auth_set_key() on the target),
> nvme_auth_extract_key() finds it in the keyring before the old key is
> revoked and returns key == old_key with generated = false.  Because
> ctrl->host_key_generated is still true, key_revoke(old_key) then revokes
> key itself, causing subsequent authentication to fail with -EKEYREVOKED.
> Should these paths check old_key != key before revoking old_key?
> 

Fixed with the next version.

>> @@ -913,16 +922,18 @@ static ssize_t dhchap_ctrl_secret_show(struct device *dev,
>>   		mutex_unlock(&ctrl->dhchap_auth_mutex);
>>   		return sysfs_emit(buf, "none\n");
>>   	}
>> +
>>   	down_read(&key->sem);
>>   	if (key_validate(key))
>>   		count = sysfs_emit(buf, "<invalidated>");
> 
> [Severity: Low]
> Should "<invalidated>" have a trailing newline here to match
> dhchap_secret_show() and the other branches of dhchap_ctrl_secret_show()?
> 

Fixed with the next version.

> [ ... ]
> 
>> @@ -1090,9 +1110,11 @@ static umode_t nvme_dev_attrs_are_visible(struct kobject *kobj,
>>   		return 0;
>>   	if (a == &dev_attr_dhchap_ctrl_secret.attr && !ctrl->opts)
>>   		return 0;
>> -	if (a == &dev_attr_dhchap_key.attr && !ctrl->opts)
>> +	if (a == &dev_attr_dhchap_key.attr && !ctrl->opts &&
>> +	    !ctrl->host_key_generated)
>>   		return 0;
>> -	if (a == &dev_attr_dhchap_ctrl_key.attr && !ctrl->opts)
>> +	if (a == &dev_attr_dhchap_ctrl_key.attr && !ctrl->opts &&
>> +	    !ctrl->ctrl_key_generated)
>>   		return 0;
>>   #endif
> 
> [Severity: Medium]
> Should the visibility conditions for dev_attr_dhchap_key.attr and
> dev_attr_dhchap_ctrl_key.attr use || instead of &&?
> 
> On Fabrics controllers ctrl->opts is non-NULL, so !ctrl->opts is false and
> the !ctrl->host_key_generated / !ctrl->ctrl_key_generated checks are never
> reached.  In addition, because sysfs group visibility is only evaluated at
> device creation unless sysfs_update_group() is called, changing
> ctrl->host_key_generated or ctrl->ctrl_key_generated later in
> dhchap_secret_store() or dhchap_ctrl_secret_store() will not update the
> visibility of these attributes.
> 

Dropped from the next version.

>> diff --git a/drivers/nvme/target/auth.c b/drivers/nvme/target/auth.c
>> index 8b77164512c9c..7204ace149565 100644
>> --- a/drivers/nvme/target/auth.c
>> +++ b/drivers/nvme/target/auth.c
> [ ... ]
>> @@ -46,6 +57,7 @@ void nvmet_auth_revoke_key(struct nvmet_host *host, bool set_ctrl)
>>   int nvmet_auth_set_key(struct nvmet_host *host, const char *secret,
>>   		       bool set_ctrl)
>>   {
>> +	bool generated = false;
>>   	struct key *key;
>>   	size_t len;
>>   
>> @@ -56,7 +68,7 @@ int nvmet_auth_set_key(struct nvmet_host *host, const char *secret,
>>   		return 0;
>>   	}
>>   	len = strcspn(secret, "\n");
>> -	key = nvme_auth_extract_key(NULL, secret, len);
>> +	key = nvme_auth_extract_key(NULL, secret, len, &generated);
> 
> [Severity: High]
> Does clearing a host or controller key via configfs trigger a NULL pointer
> dereference in nvmet_auth_set_key()?
> 
> In nvmet_host_dhchap_key_store() and nvmet_host_dhchap_ctrl_key_store(),
> writing an empty string or newline leaves keydata as NULL:
> 
> drivers/nvme/target/configfs.c:nvmet_host_dhchap_key_store() {
> 	...
> 	len = strcspn(page, "\n");
> 	if (len) {
> 		keydata = kstrndup(page, len, GFP_KERNEL);
> 		if (!keydata)
> 			return -ENOMEM;
> 	}
> 
> 	ret = nvmet_auth_set_key(host, keydata, false);
> 	...
> }
> 
> nvmet_auth_set_key() then calls strlen(secret) at the start of the
> function without checking if (!secret), dereferencing NULL.
> 

Fixed with the next version.

>> diff --git a/drivers/nvme/target/configfs.c b/drivers/nvme/target/configfs.c
>> index 12c093f4c8363..bc46d760aaa4a 100644
>> --- a/drivers/nvme/target/configfs.c
>> +++ b/drivers/nvme/target/configfs.c
>> @@ -2248,13 +2248,14 @@ static ssize_t nvmet_host_dhchap_key_show(struct config_item *item,
>>   		down_read(&key->sem);
>>   		if (key_validate(key))
>>   			ret = sprintf(page, "<invalidated>\n");
>> -		else {
>> +		else if (host->dhchap_key_generated) {
>>   			ret = key->type->read(key, page, PAGE_SIZE);
>>   			if (ret > 0) {
>>   				page[ret] = '\n';
>>   				ret++;
>>   			}
>> -		}
>> +		} else
>> +			ret = sprintf(page, "%s\n", key->description);
>>   		up_read(&key->sem);
>>   		key_put(key);
>>   	}
>> @@ -2305,13 +2306,14 @@ static ssize_t nvmet_host_dhchap_ctrl_key_show(struct config_item *item,
>>   		down_read(&key->sem);
>>   		if (key_validate(key))
>>   			ret = sprintf(page, "<invalidated>\n");
>> -		else {
>> +		else if (host->dhchap_ctrl_key_generated) {
>>   			ret = key->type->read(key, page, PAGE_SIZE);
>>   			if (ret > 0) {
>>   				page[ret] = '\n';
>>   				ret++;
>>   			}
>> -		}
>> +		} else
>> +			ret = sprintf(page, "%s\n", key->description);
>>   		up_read(&key->sem);
>>   		key_put(key);
>>   	}
> 
> [Severity: Medium]
> Can sprintf(page, "%s\n", key->description) in nvmet_host_dhchap_key_show()
> and nvmet_host_dhchap_ctrl_key_show() overflow the PAGE_SIZE configfs
> buffer by 1 byte?
> 
> add_key() permits key->description up to 4095 characters (KEY_MAX_DESC_SIZE
> is 4096 including the NUL terminator), so appending "\n" and the
> terminating NUL writes 4097 bytes into the 4096-byte page buffer.  Using
> scnprintf(page, PAGE_SIZE, "%s\n", key->description) would avoid writing
> past the end of page.
> 

Fixed with the next version.

>> diff --git a/include/linux/nvme-auth.h b/include/linux/nvme-auth.h
>> index 75e1e75e298e1..d5fbae8fc510b 100644
>> --- a/include/linux/nvme-auth.h
>> +++ b/include/linux/nvme-auth.h
>> @@ -32,7 +32,7 @@ void nvme_auth_hmac_update(struct nvme_auth_hmac_ctx *hmac, const u8 *data,
>>   void nvme_auth_hmac_final(struct nvme_auth_hmac_ctx *hmac, u8 *out);
>>   
>>   struct key *nvme_auth_extract_key(struct key *keyring, const char *secret,
>> -				  size_t secret_len);
>> +				  size_t secret_len, bool *generated);
> 
> [Severity: Low]
> The commit message notes that the secret parameter of
> nvme_auth_extract_key() was renamed to input, but this declaration in
> include/linux/nvme-auth.h still uses secret and secret_len.
> 

Fixed with the next version.

> [Severity: High]
> Also in the keyring headers included by drivers/nvme/host/sysfs.c,
> drivers/nvme/host/fabrics.c and drivers/nvme/target/configfs.c, do the
> !CONFIG_NVME_KEYRING stubs in include/linux/nvme-keyring.h break the build
> when CONFIG_NVME_KEYRING is disabled?
> 
> include/linux/nvme-keyring.h {
> 	...
> static inline struct key *nvme_tls_psk_refresh(struct key *keyring,
> 		const char *hostnqn, const char *subnqn, *data, u8 hmac_id,
> 		u8 *data, size_t data_len, const char *digest)
> {
> 	return ERR_PTR(-ENOTSUPP);
> }
> 	...
> u8 nvme_dhchap_psk_hash(struct key *key)
> {
> 	return 0;
> }
> }
> 
> nvme_tls_psk_refresh() has a stray untyped *data parameter before
> u8 hmac_id, and nvme_dhchap_psk_hash() is missing static inline, causing
> compile and multiple-definition link errors whenever CONFIG_NVME_KEYRING=n.
> 
Fixed with the next version.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
