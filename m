Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177710;
	b=MukPI3rkTAusFqvhHh4ZdJxhJ7HrrgpZdIJ1BB20o4iGDWNa0EH0xPUeYXc2hRRXBh4f
	 RUNLYjGDZxOpwgQxDvpXMcAPhvushGacNtU+hFTrUmvkD0uGfIQeX4uuUkKPDgXRMQbz8
	 /2kojzuVVGG8HXgUTe2aqrw+Fwbe+kEtRv+4H/K3w4usHisSoPUTBwRlzPRYVaACMD5vm
	 WvnmFH/kCEcDXP+5rVQrfFoQeFrWSyjAtfX6ghzNIlHUedZ5cnT/EofkmD4m4h+qwPqwY
	 7ehzmxyitM3Lwsxo2JQcz8Zt19brm/BQUf8p6j+C33pY94w5B6HKcAYX/5LI7XbdRZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177710;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:
	 X-Spam-Score;
	bh=aiHkRC4UgeGjxBc+R6wbjmW9IP2eD4lch1fFVoOUvuo=;
	b=4alNzSYO7LXrbaL65tkkMVdAvrdG/eFbGz0K3W1oOAZt9uFyYv6hyymHv6tW6KA0g+GJ
	 IcuSMPIkjuKPM4O7UROJwdN3umjvsx5q+tX43P60JuhGS4vz5dozQLOLk2lAsgZXOu3Ff
	 qgmXne3Qs0lwBzuYvEmfZ60iwpmtLT28UNOX0L4qh1kCl4OU6LPcK9ZtrzCBXTJy6nKzx
	 iLGTIZHV2AZC7ypG9FV9luwWhgEcAQZyXbS6BYCNqeBTpHCbTR7vPAcadNB0AN6QP9EvC
	 cUIqGdqMZ/vUcIRjNRhyD956zAWimGViP89sdCKgUgCJpcA/jRiMPdFTdgE5diGv+kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=f4soC6c2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SYGOTaUi;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=f4soC6c2;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SYGOTaUi;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05C1606A320
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 12:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F05C1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=f4soC6c2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SYGOTaUi;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=f4soC6c2;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SYGOTaUi
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F2F53225B6;
	Fri, 20 Nov 2026 12:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795177708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aiHkRC4UgeGjxBc+R6wbjmW9IP2eD4lch1fFVoOUvuo=;
	b=f4soC6c26s7pl0z0zEhNKIf1tipAfR8HudAwgvnfVHQq1KwveTCNczeMR126hgkh9TqTxn
	sAnWXIE5mdVZj05Iu2nOa/RcUdo7mMQ2gn1Q47ky37hFNZXJP4CQkJZ4DbrUXSNR/Gc3WG
	9e3nIW1ik3PXXLSRNT4r/w5/U4EjEvg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795177708;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aiHkRC4UgeGjxBc+R6wbjmW9IP2eD4lch1fFVoOUvuo=;
	b=SYGOTaUiD9QMG8HBhfiMiCA+iBO2SfC9fGpn7m8X1Sak3Pd18dgqOyIZflvCewxPt7CVNu
	53rRke5NLTzC0qBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=f4soC6c2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SYGOTaUi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795177708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aiHkRC4UgeGjxBc+R6wbjmW9IP2eD4lch1fFVoOUvuo=;
	b=f4soC6c26s7pl0z0zEhNKIf1tipAfR8HudAwgvnfVHQq1KwveTCNczeMR126hgkh9TqTxn
	sAnWXIE5mdVZj05Iu2nOa/RcUdo7mMQ2gn1Q47ky37hFNZXJP4CQkJZ4DbrUXSNR/Gc3WG
	9e3nIW1ik3PXXLSRNT4r/w5/U4EjEvg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795177708;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aiHkRC4UgeGjxBc+R6wbjmW9IP2eD4lch1fFVoOUvuo=;
	b=SYGOTaUiD9QMG8HBhfiMiCA+iBO2SfC9fGpn7m8X1Sak3Pd18dgqOyIZflvCewxPt7CVNu
	53rRke5NLTzC0qBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C5CEC1348F;
	Fri, 20 Nov 2026 12:28:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ey+2Kes8AGu2MAAAD6G6ig
	(envelope-from <hare@suse.de>); Fri, 20 Nov 2026 12:28:27 +0000
Message-ID: <c05e876a-0f9c-4d60-8a86-829e9492e692@suse.de>
Date: Fri, 20 Nov 2026 13:28:27 +0100
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
Subject: Re: [PATCH v4 2/9] nvme-keyring: add 'dhchap' key type
To: sashiko-reviews@lists.linux.dev, Hannes Reinecke <hare@kernel.org>
Cc: linux-nvme@lists.infradead.org
References: <20261120-dhchap-keyring-v4-v4-0-5f8c7d9926ee@kernel.org>
 <20261120-dhchap-keyring-v4-v4-2-5f8c7d9926ee@kernel.org>
 <sashiko-outbox-225040@kernel.org>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <sashiko-outbox-225040@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F2F53225B6
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
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -13.50

On 11/20/26 12:28 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issues to consider:
> - [Critical] nvme-keyring: out-of-bounds reads and underflows in
>    nvme_dhchap_psk_preparse()
> - [High] nvme-keyring: uninitialized keylen used in
>    nvme_dhchap_psk_preparse()
> - [Medium] nvme-keyring: unsigned error check and size mismatch in
>    nvme_dhchap_psk_read()
> - [Medium] nvme-keyring: out-of-bounds memcmp() in
>    nvme_dhchap_psk_match()
> --
> 
> commit 329ebc74c917187a04d7c54885592dcb5f74d0dd
> Author: Hannes Reinecke <hare@kernel.org>
> 
> nvme-keyring: add 'dhchap' key type
> 
> This commit adds a 'dhchap' key type to store DH-HMAC-CHAP secret keys with
> a user-type compatible payload and a read callback that formats keys in their
> base64-encoded representation.
> 
>> diff --git a/drivers/nvme/common/keyring.c b/drivers/nvme/common/keyring.c
>> index 87cb51e1f5a7f..96561f2dd81b8 100644
>> --- a/drivers/nvme/common/keyring.c
>> +++ b/drivers/nvme/common/keyring.c
> [ ... ]
>> @@ -253,6 +256,212 @@ key_serial_t nvme_tls_psk_default(struct key *keyring,
>>   }
>>   EXPORT_SYMBOL_GPL(nvme_tls_psk_default);
>>   
>> +static void nvme_dhchap_psk_describe(const struct key *key, struct seq_file *m)
>> +{
>> +	seq_puts(m, key->description);
>> +	seq_printf(m, ": %u", key->datalen);
>> +}
>> +
>> +static bool nvme_dhchap_psk_match(const struct key *key,
>> +				  const struct key_match_data *match_data)
>> +{
>> +	const char *match_id;
>> +	size_t match_len;
>> +
>> +	if (!key->description) {
>> +		pr_debug("%s: no key description\n", __func__);
>> +		return false;
>> +	}
>> +	if (!match_data->raw_data) {
>> +		pr_debug("%s: no match data\n", __func__);
>> +		return false;
>> +	}
>> +	match_id = match_data->raw_data;
>> +	match_len = strlen(match_id);
>> +	pr_debug("%s: match '%s' '%s' len %zd\n",
>> +		 __func__, match_id, key->description, match_len);
>> +
>> +	return !memcmp(key->description, match_id, match_len);
>> +}
> 
> [Severity: Medium]
> Can memcmp() read past the end of key->description here?  key_alloc()
> allocates strlen(key->description) + 1 bytes, so searching with a match_id
> longer than key->description reads out of bounds, while a shorter match_id
> matches any key whose description shares that prefix.
> 
Correct, the size for both strings should match. I'll fix it up for the
next round.

> [ ... ]
> 
>> +static int nvme_dhchap_psk_preparse(struct key_preparsed_payload *prep)
>> +{
>> +	struct user_key_payload *upayload;
>> +	size_t datalen = prep->datalen, keylen;
>> +	int ret;
>> +	u32 crc;
>> +	u8 version, hmac;
>> +
>> +	if (!prep->data) {
>> +		pr_debug("%s: Empty data", __func__);
>> +		prep->payload.data[0] = NULL;
>> +		prep->quotalen = 0;
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (sscanf(prep->data, "DHHC-%01hhu:%02hhu:%*s",
>> +		   &version, &hmac) != 2) {
>> +		pr_debug("%s: invalid key data '%s'\n", __func__,
>> +			 (char *)prep->data);
>> +		prep->payload.data[0] = NULL;
>> +		prep->quotalen = 0;
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* skip header and final ':' character */
>> +	datalen -= 11;
>> +
>> +	/*
>> +	 * payload is < key | version | hmac >
>> +	 * base64 decode will always return less data
>> +	 * than the encoded data, so allocating the size
>> +	 * of the encoded data will be large enough.
>> +	 */
>> +	upayload = kzalloc(sizeof(*upayload) + datalen, GFP_KERNEL);
>> +	if (!upayload) {
>> +		prep->payload.data[0] = NULL;
>> +		prep->quotalen = 0;
>> +		return -ENOMEM;
>> +	}
>> +
>> +	/* decode the data */
>> +	prep->quotalen = keylen;
> 
> [Severity: High]
> Isn't keylen uninitialized when assigned to prep->quotalen?
> generic_key_instantiate() passes prep->quotalen to key_payload_reserve(),
> corrupting per-user key quota accounting and exposing the lower 16 bits of
> the stack value via key->datalen in /proc/keys.
> 
Indeed. Fixed up for the next version.

>> +	prep->payload.data[0] = upayload;
>> +	ret = base64_decode(prep->data + 10, datalen, upayload->data,
>> +			    true, BASE64_STD);
>> +	if (ret < 0) {
>> +		pr_debug("%s: Failed to decode key %s\n",
>> +			 __func__, (char *)prep->data + 10);
>> +		return ret;
>> +	}
>> +	ret -= 4;
>> +	crc = ~crc32(~0, upayload->data, ret);
> 
> [Severity: Critical]
> Can malformed or short payloads from add_key() trigger out-of-bounds reads
> and integer underflows in nvme_dhchap_psk_preparse()?
> 
> add_key() copies plen bytes from userspace into prep->data without appending
> a NUL terminator, so sscanf() and the pr_debug() %s calls can read past
> prep->data + prep->datalen.  Because %*s is assignment-suppressed and
> %02hhu matches one or two digits, sscanf() can also return 2 when
> prep->datalen < 11 (for example, "DHHC-1:01"), causing datalen -= 11 to
> underflow and wrap sizeof(*upayload) + datalen in kzalloc().
> 
Correct. I've updated the parsing code to the improved version in
nvme_auth_extract_key().

> Even when prep->datalen >= 11, if base64_decode() returns 0..3 (such as on
> an 11-byte payload "DHHC-1:01::"), ret -= 4 becomes negative and wraps to
> SIZE_MAX - 3 .. SIZE_MAX when passed as size_t len to crc32().  In addition,
> base64_decode() returns -1 on error, which leaks out as -EPERM instead of
> -EINVAL, and the decoded key length is never checked against the valid
> DH-HMAC-CHAP sizes (32, 48, or 64 bytes).
> 
Ok, fixed up for the next version.

> [ ... ]
> 
>> +static long nvme_dhchap_psk_read(const struct key *key,
>> +				 char *buffer, size_t buflen)
>> +{
>> +	const struct user_key_payload *upayload;
>> +	size_t datalen, keylen;
>> +	u8 version, hmac;
>> +	long ret;
>> +
>> +	upayload = user_key_payload_locked(key);
>> +	/*
>> +	 * Expected output string length:
>> +	 * strlen("DHHC-") +
>> +	 * version (= 1) +
>> +	 * ':' (= 1) +
>> +	 * hmac (= 2) +
>> +	 * ':' (= 1) +
>> +	 * encoded base64 key length +
>> +	 * CRC length (= 4) +
>> +	 * ':' (= 1)
>> +	 */
>> +	keylen = nvme_dhchap_decoded_key_size(upayload->datalen) + 15;
>> +	if (keylen < 0 || !buffer || buflen == 0)
>> +		return keylen;
>> +
>> +	if (buflen < keylen)
>> +		return -EINVAL;
> 
> [Severity: Medium]
> Since keylen is an unsigned size_t, is keylen < 0 always false here?
> Adding 15 before checking for an error also turns -EINVAL from
> nvme_dhchap_decoded_key_size() into -7 (-E2BIG), and double-counts the
> 4-byte CRC because nvme_dhchap_decoded_key_size() already returns the
> encoded length of the key plus CRC (48, 72, or 92 bytes), so the total
> formatted length is 4 bytes larger than what nvme_dhchap_psk_read()
> actually writes (+ 11).
> 
Ok, fixed up for the next version.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
