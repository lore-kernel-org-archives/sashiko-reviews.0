Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186963;
	b=147RCe0nG7Qeiv9yYrM/sD7UbzuriBl0denvvfQSufvhwNmuaKriL8dvBVM3o8FoOQo4
	 If8+TWrJlPWrFIRecFAv4hFQUld7X8yIAG9oqW8BEsgfKWezS6h7uYYShTcMxpI5XT4c4
	 q/t6oPC2sewEGVyk6meTNd1ILpqurile0rqfQyU/27LM8zhENerbRWTenUYUI0669ifLZ
	 M75BCdtirMS7NDTUmxOIU3uFmGmUG6LGonfH7bI+6/nESTIcVKpvc2R+pxGgAanuTpPgv
	 h3cpc+P2CpZlbwfb1c85MQoVaRYf6HGFV4nox2X2owHO7+f9ipSbkxtq64GNKWgct7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186963;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:
	 X-Spam-Score;
	bh=V1Zb6/ZDKYSS5Ujt+fWXBSl6jv8FIJReeUHiPtoYBq4=;
	b=TKtVSQKV4aANicT8DaVqtVjz+xe+wuE9N5oRw442K7ehwSgu+dbPfC2VRar7z/HsGZyM
	 azkoHCcSWUQoEG8NhErSMrz2djmDsAXvoDNLJbphtN1BE0I7eEBRoTmToTxsdKb8cll2X
	 CRcpU6DJ0+F8Xn19LSLxCKrQMbzTOxTXuwnWCksl+kIf7AIy3+VbMYd9mpPYhenHJHGwq
	 3shrNa9uEeSsuiFnlWS076zXZxFtjPirmUwDYcGwgCJRsW0gQCdluZCDEWvn+xgLyinLt
	 X5OwRnxrmib11nNxfk08RlLC4L9jeZh24yv3Q6nEfxilBzEXsP6fu1yMRgHy4CHFr+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="UbY/C7vg";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ye8Rw36H;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JNxii64k;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="1/bdNKvD";
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F08606A33C
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 15:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2F08606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UbY/C7vg;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ye8Rw36H;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JNxii64k;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1/bdNKvD
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1A99E1F7BA;
	Fri, 20 Nov 2026 15:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795186961; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V1Zb6/ZDKYSS5Ujt+fWXBSl6jv8FIJReeUHiPtoYBq4=;
	b=UbY/C7vg9TjZRfurBaGng32LCOYFKWEqjhqoP3ojp6r32U98OMHGZWY0y71S49UgjBgsdy
	IABm7G5l+ktMdzm8x6Ndivre95gtuo978BvKDPw4LiVUEeMRNifptp3RhJq06zSLvGzCb7
	lf2nUh6YSMwXsP4AP56hVEWLEwPRjDs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795186961;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V1Zb6/ZDKYSS5Ujt+fWXBSl6jv8FIJReeUHiPtoYBq4=;
	b=ye8Rw36HwlzUH+qRHcK8QUVFRORq6vgHc2Th4QsAdr5q/tY3zE/FFix0/KQagJyXZQJt/6
	KUkBXTRYx5LmEFBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JNxii64k;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="1/bdNKvD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795186959; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V1Zb6/ZDKYSS5Ujt+fWXBSl6jv8FIJReeUHiPtoYBq4=;
	b=JNxii64kCMpdaE4m8H2PMDiZOYeDS/zvqWdkT0O/SpYQaBb/MMWN11iCu5dQ73KBKM/Z7s
	Fecu7aYC7a35Zq33+PzWJmIES4FYvLCnkotx2cvLSJZ0nQZKoHsMKMSyVmhZNGfGwAUKrM
	el+kjIMO2d44nqor+XXOGx3C3ZMH6lQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795186959;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V1Zb6/ZDKYSS5Ujt+fWXBSl6jv8FIJReeUHiPtoYBq4=;
	b=1/bdNKvDdLimbgY4q+q6UVmFtAhgL48I0QLKFu7PijJ1XXpT+ENH9oIyJzU+bKYveuB99x
	1rCLrJ1/zrQWzrCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E1E5D1342D;
	Fri, 20 Nov 2026 15:02:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mqjyLg5hAGtYTwAAD6G6ig
	(envelope-from <hare@suse.de>); Fri, 20 Nov 2026 15:02:38 +0000
Message-ID: <f9ef564b-08ca-4e6e-905c-8554d653b174@suse.de>
Date: Fri, 20 Nov 2026 16:02:38 +0100
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
Subject: Re: [PATCH v4 8/9] nvme-fabrics: allow to pass in keyring by name
To: sashiko-reviews@lists.linux.dev, Hannes Reinecke <hare@kernel.org>
Cc: linux-nvme@lists.infradead.org
References: <20261120-dhchap-keyring-v4-v4-0-5f8c7d9926ee@kernel.org>
 <20261120-dhchap-keyring-v4-v4-8-5f8c7d9926ee@kernel.org>
 <sashiko-outbox-225080@kernel.org>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <sashiko-outbox-225080@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1A99E1F7BA
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

On 11/20/26 12:37 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] nvme-fabrics: opt_tokens keyring=%d pattern rejects keyring
>    names
> - [Medium] nvme-fabrics: build failure in nvmf_parse_options() when
>    !CONFIG_KEYS
> --
> 
> commit 0ba36c8d6abaed9ca222b0bbab73723c1ce8243d
> Author: Hannes Reinecke <hare@kernel.org>
> 
> nvme-fabrics: allow to pass in keyring by name
> 
> This commit updates nvmf_parse_options() so the NVMF_OPT_KEYRING option
> falls back to looking up a keyring by description via request_key() when the
> argument is not a positive integer serial number.
> 
>> diff --git a/drivers/nvme/host/fabrics.c b/drivers/nvme/host/fabrics.c
>> index cd728768a68fc..71da67b543aa4 100644
>> --- a/drivers/nvme/host/fabrics.c
>> +++ b/drivers/nvme/host/fabrics.c
> 
> [ ... ]
> 
>> @@ -993,13 +994,23 @@ static int nvmf_parse_options(struct nvmf_ctrl_options *opts,
>>   			break;
>>   		case NVMF_OPT_KEYRING:
>>   			if (match_int(args, &key_id) || key_id <= 0) {
>> -				ret = -EINVAL;
>> -				goto out;
>> -			}
>> -			key = nvmf_parse_key(key_id);
>> -			if (IS_ERR(key)) {
>> -				ret = PTR_ERR(key);
>> -				goto out;
>> +				p = match_strdup(args);
> 
> [Severity: High]
> Can a keyring name ever reach this branch while opt_tokens still defines
> NVMF_OPT_KEYRING as "keyring=%d"?
> 
> drivers/nvme/host/fabrics.c:opt_tokens {
>      ...
> 	{ NVMF_OPT_KEYRING,		"keyring=%d"		},
>      ...
> }
> 
> Because match_token() requires "%d" arguments to be valid integers, any
> non-numeric name such as "keyring=.nvme" fails to match and makes
> nvmf_parse_options() reject the option with -EINVAL in the default switch
> case.  In addition, reading /dev/nvme-fabrics still advertises "keyring=%d"
> to userspace, while passing a non-positive integer serial number such as
> "keyring=0" or "keyring=-1" enters this fallback and looks up the number as
> a keyring description instead of returning -EINVAL.
> 
Fixed with the next round.

>> +				if (!p) {
>> +					ret = -ENOMEM;
>> +					goto out;
>> +				}
>> +				key = request_key(&key_type_keyring, p, NULL);
> 
> [Severity: Medium]
> Does this break the build when CONFIG_NVME_FABRICS is enabled and
> CONFIG_KEYS is disabled?
> 
> CONFIG_NVME_FABRICS only selects CONFIG_NVME_KEYRING (which selects
> CONFIG_KEYS) when CONFIG_NVME_TCP_TLS or CONFIG_NVME_HOST_AUTH is enabled.
> Both key_type_keyring in include/linux/key-type.h and request_key() in
> include/linux/key.h are declared under #ifdef CONFIG_KEYS with no stub for
> !CONFIG_KEYS builds.
> 
Fixed with the next round.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
