Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180092;
	b=PJhj0bhdqC2OzGEc3qfKGvI+RJ0V7ZQPqvvUoDTIFsh7W7jkRlEZXCsRZpNzoAJC0Pdi
	 2h9WQJcadidOLoEC8voNTz0ceLYrCrHzfqeJ1GnYwKh0i7Vj0LYVKb7rcp3AtCHADZTZb
	 7ALUBJcm1U9RnJkBd8/ElD7vB8iOmwE742IPVg1w+9ek0AgkbCokcDlY8OO8OA1vdJDJ5
	 sjIPq89gY8hTWr4u5u4ZKPMO+rjXC/7FxIvbSDgdsxrt5/LAJp58gi1p/ze1TsuW7KqTD
	 zqKIt/SWPSwfYU5/usSdzUSjUdZeQEUSTJiPVFwY1xv+uJzKmcVoTT3Kxzc0U8H+O+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180092;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:
	 X-Spam-Score;
	bh=+UHnaZhmB+tBn33C9QrNgZEzorJallBIClPDneBa5Sw=;
	b=g2J2CBoGSP6+izbMS91NXeZMSe2Cu54fnMVPuCXGZYG1g26s8f/+yR9skFWIsk/+ENSY
	 rTXz2kT1F4RoSr0sWbSBhkHDMns4rdLlI8GLhq3D9dKNh+hvCviPNx0qpwH3LLT0EPsuw
	 SbrtOiqQtEY8qeNMl6Nkb9lAlfAjzV3Y8pXaja04qOTwmlfOj3wVEGfsqFr4sFf9gCDqE
	 eoJ7aiintbZBd5jUBB/DDYWjEZbMfSDPKbrKdjdUYVc5gphn700h0Get5yGgUQNiQjiQa
	 ZgGnY+pbfTgmhheF4BUee655VyC44EdszkiMO3YjrwFpHOYthJwM/TWO9WAkssCgv6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=I3pBaMv6;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=vzaayjag;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=I3pBaMv6;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=vzaayjag;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CE0606A332
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 13:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25CE0606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=I3pBaMv6;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=vzaayjag;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=I3pBaMv6;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=vzaayjag
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3CFF4225DD;
	Fri, 20 Nov 2026 13:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795180089; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+UHnaZhmB+tBn33C9QrNgZEzorJallBIClPDneBa5Sw=;
	b=I3pBaMv6wnuYz7R95KX6A2BiTNrd9GhowLNqtF/eJtA2TGGg4DqoNVYXbsDxN7NYctSb7Z
	lPkYyWXKhEQGUs+H2E6NHaz3NuHRI8BS0X6laVtJH1Uhjwp/93HKMsFenvglntxg4542CH
	N3meC0VLU8YfNyOEQF/p2gV2IQ1bx+w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795180089;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+UHnaZhmB+tBn33C9QrNgZEzorJallBIClPDneBa5Sw=;
	b=vzaayjagb2bF7qkGOvKop5k72PXG2czp3iFOEO7jToja7rKdT9YMpupIzmSOCRX0nnANwq
	pb5qXCrb+ALOPmCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=I3pBaMv6;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vzaayjag
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795180089; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+UHnaZhmB+tBn33C9QrNgZEzorJallBIClPDneBa5Sw=;
	b=I3pBaMv6wnuYz7R95KX6A2BiTNrd9GhowLNqtF/eJtA2TGGg4DqoNVYXbsDxN7NYctSb7Z
	lPkYyWXKhEQGUs+H2E6NHaz3NuHRI8BS0X6laVtJH1Uhjwp/93HKMsFenvglntxg4542CH
	N3meC0VLU8YfNyOEQF/p2gV2IQ1bx+w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795180089;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+UHnaZhmB+tBn33C9QrNgZEzorJallBIClPDneBa5Sw=;
	b=vzaayjagb2bF7qkGOvKop5k72PXG2czp3iFOEO7jToja7rKdT9YMpupIzmSOCRX0nnANwq
	pb5qXCrb+ALOPmCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0F7931342D;
	Fri, 20 Nov 2026 13:08:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OxPbNjhGAGtCWQAAD6G6ig
	(envelope-from <hare@suse.de>); Fri, 20 Nov 2026 13:08:09 +0000
Message-ID: <80c08ecd-9610-4e92-8c34-fb2bde6dc622@suse.de>
Date: Fri, 20 Nov 2026 14:08:08 +0100
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
Subject: Re: [PATCH v4 3/9] nvme-auth: switch to use 'struct key'
To: sashiko-reviews@lists.linux.dev, Hannes Reinecke <hare@kernel.org>
Cc: linux-nvme@lists.infradead.org
References: <20261120-dhchap-keyring-v4-v4-0-5f8c7d9926ee@kernel.org>
 <20261120-dhchap-keyring-v4-v4-3-5f8c7d9926ee@kernel.org>
 <sashiko-outbox-225045@kernel.org>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <sashiko-outbox-225045@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3CFF4225DD
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -13.50

On 11/20/26 12:31 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issues to consider:
> - [High] nvme-keyring: build failure and mismatched stubs when
>    !CONFIG_NVME_KEYRING
> - [High] nvme-auth: missing key length validation in
>    nvme_auth_extract_key()
> - [Low] nvme-auth: missing kernel-doc param and leftover struct
>    nvme_dhchap_key
> - [Low] nvme-auth: pointer signedness mismatches in key extraction and
>    reading
> --
> 
> commit ee0a57ee4ed46fe92599175ec65168d3ebd0acca
> Author: Hannes Reinecke <hare@kernel.org>
> 
> nvme-auth: switch to use 'struct key'
> 
> This commit replaces struct nvme_dhchap_key with struct key using the
> dhchap key type across the NVMe common, host, and target authentication
> code.
> 
>> diff --git a/drivers/nvme/common/auth.c b/drivers/nvme/common/auth.c
>> index 569f21ad4fc7e..b7092deed9b06 100644
>> --- a/drivers/nvme/common/auth.c
>> +++ b/drivers/nvme/common/auth.c
> [ ... ]
>> -struct nvme_dhchap_key *nvme_auth_extract_key(const char *secret, u8 key_hash)
>> +/**
>> + * nvme_auth_extract_key - extract the DH-HMAC-CHAP key
>> + *
>> + * @secret: key data
>> + * @secret_len: length of @secret
>> + *
>> + * Extracts a dhchap key from @secret.
>> + *
>> + * Returns the dhchap key or an error pointer on failure.
>> + */
>> +struct key *nvme_auth_extract_key(struct key *keyring, const char *secret,
>> +				  size_t secret_len)
>>   {
>> -	struct nvme_dhchap_key *key;
>> -	const char *p;
>> -	u32 crc;
>> -	int ret, key_len;
>> -	size_t allocated_len = strlen(secret);
>> -
>> -	/* Secret might be affixed with a ':' */
>> -	p = strrchr(secret, ':');
>> -	if (p)
>> -		allocated_len = p - secret;
>> -	key = nvme_auth_alloc_key(allocated_len, 0);
>> -	if (!key)
>> -		return ERR_PTR(-ENOMEM);
>> -
>> -	key_len = base64_decode(secret, allocated_len, key->key, true, BASE64_STD);
>> -	if (key_len < 0) {
>> -		pr_debug("base64 key decoding error %d\n",
>> -			 key_len);
>> -		ret = key_len;
>> -		goto out_free_key;
>> -	}
>> +	struct key *key;
>>   
>> -	if (key_len != 36 && key_len != 52 &&
>> -	    key_len != 68) {
>> -		pr_err("Invalid key len %d\n", key_len);
>> -		ret = -EINVAL;
>> -		goto out_free_key;
>> +	key = nvme_dhchap_psk_create(keyring, secret, secret_len);
>> +	if (!IS_ERR(key)) {
>> +		pr_debug("generated dhchap key %s\n",
>> +			 key->description);
>>   	}
>> -
>> -	/* The last four bytes is the CRC in little-endian format */
>> -	key_len -= 4;
>> -	/*
>> -	 * The linux implementation doesn't do pre- and post-increments,
>> -	 * so we have to do it manually.
>> -	 */
>> -	crc = ~crc32(~0, key->key, key_len);
>> -
>> -	if (get_unaligned_le32(key->key + key_len) != crc) {
>> -		pr_err("key crc mismatch (key %08x, crc %08x)\n",
>> -		       get_unaligned_le32(key->key + key_len), crc);
>> -		ret = -EKEYREJECTED;
>> -		goto out_free_key;
>> -	}
>> -	key->len = key_len;
>> -	key->hash = key_hash;
>>   	return key;
>> -out_free_key:
>> -	nvme_auth_free_key(key);
>> -	return ERR_PTR(ret);
>>   }
>>   EXPORT_SYMBOL_GPL(nvme_auth_extract_key);
> 
> [Severity: High]
> Does replacing the parser here with nvme_dhchap_psk_create() ->
> key_create() -> nvme_dhchap_psk_preparse() drop the decoded key length and
> prefix length checks, allowing an out-of-bounds read in crc32()?
> 
> drivers/nvme/common/keyring.c:nvme_dhchap_psk_preparse() {
> 	...
> 	if (sscanf(prep->data, "DHHC-%01hhu:%02hhu:%*s",
> 		   &version, &hmac) != 2) {
> 	...
> 	}
> 
> 	/* skip header and final ':' character */
> 	datalen -= 11;
> 	...
> 	/* decode the data */
> 	prep->quotalen = keylen;
> 	prep->payload.data[0] = upayload;
> 	ret = base64_decode(prep->data + 10, datalen, upayload->data,
> 			    true, BASE64_STD);
> 	if (ret < 0) {
> 		...
> 		return ret;
> 	}
> 	ret -= 4;
> 	crc = ~crc32(~0, upayload->data, ret);
> 	if (get_unaligned_le32(upayload->data + ret) != crc) {
> 	...
> }
> 
> nvme_dhchap_psk_preparse() does not verify that ret is 36, 52, or 68
> before subtracting 4, so a secret whose base64 body decodes to 0..3 bytes
> (such as "DHHC-1:00:AAAA:") makes ret negative and passes a huge size_t to
> crc32(), reading past upayload->data across kernel memory, while other
> invalid decoded sizes are accepted.
> 
> A 1-digit hash ID also satisfies sscanf(), so a 10-byte secret such as
> "DHHC-1:0:a" underflows datalen -= 11 to SIZE_MAX (or has its first base64
> character skipped by prep->data + 10), and prep->quotalen is assigned from
> the uninitialized local variable keylen.  In addition,
> nvme_dhchap_psk_create() replaces PTR_ERR(keyref) with ERR_PTR(-ENOKEY) on
> key_create() failure instead of propagating -EINVAL, -EKEYREJECTED, or
> -ENOMEM.
> 
> Finally, dhchap_secret_store() and dhchap_ctrl_secret_store() pass raw
> count (including any trailing newline) to nvme_auth_extract_key(), leaving
> the trailing ':' in the base64 input; later commits "nvme: parse dhchap
> keys during option parsing" and "nvme: allow to pass in key description as
> dhchap secret" in the series address the sysfs newline handling, while the
> nvme_dhchap_psk_preparse() validation defects and error code clobbering
> remain.
> 
That should now be fixed with the reworked version of the previous patch.

> [ ... ]
> 
>> @@ -317,12 +260,13 @@ static int nvme_auth_hash(u8 hmac_id, const u8 *data, size_t data_len, u8 *out)
>>   	return -EINVAL;
>>   }
>>   
>> -int nvme_auth_transform_key(const struct nvme_dhchap_key *key, const char *nqn,
>> +int nvme_auth_transform_key(struct key *key, const char *nqn,
>>   			    u8 **transformed_secret)
>>   {
>>   	struct nvme_auth_hmac_ctx hmac;
>> +	long key_len = 0;
>>   	u8 *transformed_data;
>> -	u8 *key_data;
>> +	u8 *key_data, key_hash;
> [ ... ]
>> +	key_data = kzalloc(key_len, GFP_KERNEL);
>> +	if (!key_data) {
>> +		up_read(&key->sem);
>> +		return -ENOMEM;
>> +	}
>> +	ret = user_read(key, key_data, key_len);
> 
> [Severity: Low]
> Does passing u8 *key_data to user_read() (which expects char *buffer)
> trigger a -Wpointer-sign compiler warning?
> 
Possibly. Fixed it up for the next version.

> Similar pointer-signedness mismatches occur in nvme_auth_extract_key() when
> passing const char *secret to const u8 *data of nvme_dhchap_psk_create(),
> and in nvmet_setup_auth() when passing u8 * host->dhchap_secret and
> host->dhchap_ctrl_secret to strlen() and nvme_auth_extract_key().
> 
Yes, that is confusing. I've now modified host->dhchap_secret and
host->dhchap_ctrl_secret to be of type 'const char *'.

>> diff --git a/include/linux/nvme-auth.h b/include/linux/nvme-auth.h
>> index 1c5ce635b169d..b8ea0945131d1 100644
>> --- a/include/linux/nvme-auth.h
>> +++ b/include/linux/nvme-auth.h
>> @@ -37,13 +37,10 @@ void nvme_auth_hmac_update(struct nvme_auth_hmac_ctx *hmac, const u8 *data,
>>   			   size_t data_len);
>>   void nvme_auth_hmac_final(struct nvme_auth_hmac_ctx *hmac, u8 *out);
>>   
>> -u32 nvme_auth_key_struct_size(u32 key_len);
>> -struct nvme_dhchap_key *nvme_auth_extract_key(const char *secret, u8 key_hash);
>> -void nvme_auth_free_key(struct nvme_dhchap_key *key);
>> -struct nvme_dhchap_key *nvme_auth_alloc_key(u32 len, u8 hash);
>> -int nvme_auth_transform_key(const struct nvme_dhchap_key *key,
>> -			    const char *nqn, u8 **transformed_secret);
>> -int nvme_auth_parse_key(const char *secret, struct nvme_dhchap_key **ret_key);
>> +struct key *nvme_auth_extract_key(struct key *keyring, const char *secret,
>> +				  size_t secret_len);
> 
> [Severity: Low]
> The commit message notes that the unused struct nvme_dhchap_key definition
> can be dropped, but struct nvme_dhchap_key is still present at the top of
> include/linux/nvme-auth.h.  Also, the new kernel-doc comment on
> nvme_auth_extract_key() in drivers/nvme/common/auth.c omits @keyring, which
> causes a W=1 kernel-doc warning.
> 
Fixed with the next version.

>> diff --git a/include/linux/nvme-keyring.h b/include/linux/nvme-keyring.h
>> index ab8971afa9734..9fef4b6add787 100644
>> --- a/include/linux/nvme-keyring.h
>> +++ b/include/linux/nvme-keyring.h
>> @@ -18,12 +18,17 @@ key_serial_t nvme_tls_psk_default(struct key *keyring,
>>   
>>   key_serial_t nvme_keyring_id(void);
>>   struct key *nvme_tls_key_lookup(key_serial_t key_id);
>> +
>> +struct key *nvme_dhchap_psk_create(struct key *keyring,
>> +		const u8 *data, size_t data_len);
>> +struct key *nvme_dhchap_psk_lookup(struct key *keyring, const char *identity);
>> +u8 nvme_dhchap_psk_hash(struct key *key);
>> +
>>   #else
>>   static inline struct key *nvme_tls_psk_refresh(struct key *keyring,
>> -		const char *hostnqn, char *subnqn, u8 hmac_id,
>>   		u8 *data, size_t data_len, const char *digest)
>>   {
>> -	return ERR_PTR(-ENOTSUPP);
>> +	return ERR_PTR(-EOPNOTSUPP);
>>   }
>>   static inline key_serial_t nvme_tls_psk_default(struct key *keyring,
>>   		const char *hostnqn, const char *subnqn)
>> @@ -36,7 +41,22 @@ static inline key_serial_t nvme_keyring_id(void)
>>   }
>>   static inline struct key *nvme_tls_key_lookup(key_serial_t key_id)
>>   {
>> -	return ERR_PTR(-ENOTSUPP);
>> +	return ERR_PTR(-EOPNOTSUPP);
>> +}
>> +static inline struct key *nvme_dhchap_psk_refresh(struct key *keyring,
>> +		const char *hostnqn, const char *subnqn,
>> +		u8 *data, size_t data_len)
>> +{
>> +	return ERR_PTR(-EOPNOTSUPP);
>> +}
>> +static inline struct key *nvme_dhchap_psk_lookup(struct key *keyring,
>> +		const char *hostnqn, const char *subnqn, u8 hmac);
>> +{
>> +	return ERR_PTR(-EOPNOTSUPP);
>> +}
>> +u8 nvme_dhchap_psk_hash(struct key *key)
>> +{
>> +	return 0;
>>   }
>>   #endif /* !CONFIG_NVME_KEYRING */
>>   #endif /* _NVME_KEYRING_H */
> 
> [Severity: High]
> Does the !CONFIG_NVME_KEYRING branch fail to build when
> include/linux/nvme-keyring.h is included with CONFIG_NVME_KEYRING disabled?
> 
> The nvme_dhchap_psk_lookup() stub has a stray semicolon after its parameter
> list and takes four arguments instead of matching the two-argument
> declaration in the CONFIG_NVME_KEYRING branch.  nvme_dhchap_psk_hash() is
> defined in the header without static inline, causing multiple-definition
> linker errors across translation units.  This branch also defines
> nvme_dhchap_psk_refresh() instead of a stub for nvme_dhchap_psk_create(),
> and removes hostnqn, subnqn, and hmac_id from the nvme_tls_psk_refresh()
> stub signature.
> 
Fixed up the declarations with the next version.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
