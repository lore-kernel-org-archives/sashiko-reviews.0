Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795512111;
	b=ghPtg2TFzvBJrgLsvyWWToMYmUwvSVZwFSL+3WtZzeRMBQmxCNjaCckaqWXgCYoLaagS
	 n0LDfEtDqPMsqTuz4qyOG96oT7egx8LE+PuKFqXwKcvtNhbFqG0ZeMAvjP/owNvIojSUG
	 MISD20iAFVlmKGAM2rV6DO8Y2qwUyGyrZ+zxEsV694X+6HAQ0Zw7EWjC2HBwI5ntQiLG4
	 NW25IIasqJ7lFA2TL7N73yiRZYEgtdIMJxoXdH2x0YAkTkWTPhX3FIqRkbfGZ4FP1sDXN
	 pa75l2TWFINNHxecDc2VocLiTlIy/gipoblmyh4UiXX0DJm6LUfXaJZS9vWfMnWerjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512111;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Spamd-Result:X-Rspamd-Server:
	 X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=lO+YBM6uqjMSJ6b8eHPVHtfj+YlagF2nKgrC7nzqIck=;
	b=r+qZRkkxl61CXPKjGxir1o2aUUO6iVAnUShqMsdGgDmtNcUPJ+y55xA7hhzNrQK8OxGt
	 p3w4r74dNLiuA4T1NcfiN27WeTNFqU3qEqioYGDMGtbWx5jkE019+4FJ/YVS3kPYA8Z4q
	 eDH2LRM2WovlY/fAttkbbs4TDli8v1oGoC8I+wHMZHPSipRUAB6fhM1ZzpJaLi11kNHKz
	 DcLiOoICgRMjrr8jh5cgGV/q9DjIP6GKa+eOVl2IAAYxBvmMNSZF5/XoXjLD5GhoLSxin
	 7DfmQNVT56xTtuBpkUd/MpV72pOdTmNu/v4+4dwzMvF6VIi+71Zya/r5OAuV5HXCpAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=MlfU0uCP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Cj9bT3po;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=MlfU0uCP;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Cj9bT3po;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE64606A6A9
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 09:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DE64606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=MlfU0uCP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Cj9bT3po;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=MlfU0uCP;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Cj9bT3po
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2F32022333;
	Tue, 24 Nov 2026 09:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795512106; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lO+YBM6uqjMSJ6b8eHPVHtfj+YlagF2nKgrC7nzqIck=;
	b=MlfU0uCPHlZppS7xCuhOeZOvbRGu0ZgUfNUqezThrV6CK47s0fYyZ6p3rokOqOw9b09HIJ
	3TcIAqEqAznkWotq2uUXaKTm1YM4eOiIc0L6dcmAkjoIjovU51Nqx/Roc1cy/gRB9mG9yF
	LKbVILoUR5N9bh8sk7Ol5ChqRRjW1dc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795512106;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lO+YBM6uqjMSJ6b8eHPVHtfj+YlagF2nKgrC7nzqIck=;
	b=Cj9bT3poPNYBUkTnE68XXH/amW3tR/G2PgHXEK61lO75Ty6Kj5CBUL23O8ft8pJXidLEwt
	JL7l/JdQY8gfXcBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MlfU0uCP;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Cj9bT3po
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795512106; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lO+YBM6uqjMSJ6b8eHPVHtfj+YlagF2nKgrC7nzqIck=;
	b=MlfU0uCPHlZppS7xCuhOeZOvbRGu0ZgUfNUqezThrV6CK47s0fYyZ6p3rokOqOw9b09HIJ
	3TcIAqEqAznkWotq2uUXaKTm1YM4eOiIc0L6dcmAkjoIjovU51Nqx/Roc1cy/gRB9mG9yF
	LKbVILoUR5N9bh8sk7Ol5ChqRRjW1dc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795512106;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lO+YBM6uqjMSJ6b8eHPVHtfj+YlagF2nKgrC7nzqIck=;
	b=Cj9bT3poPNYBUkTnE68XXH/amW3tR/G2PgHXEK61lO75Ty6Kj5CBUL23O8ft8pJXidLEwt
	JL7l/JdQY8gfXcBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 03C1C13505;
	Tue, 24 Nov 2026 09:21:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RIIwNClXBWu8QgAAD6G6ig
	(envelope-from <hare@suse.de>); Tue, 24 Nov 2026 09:21:46 +0000
Message-ID: <7c40a1c2-dd4f-47ae-aae4-63c5b9f0aab1@suse.de>
Date: Tue, 24 Nov 2026 10:21:45 +0100
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
Subject: Re: [PATCH v6 8/9] nvme-fabrics: allow to pass in keyring by name
To: sashiko-reviews@lists.linux.dev, Hannes Reinecke <hare@kernel.org>
Cc: linux-nvme@lists.infradead.org
References: <20261123-dhchap-keyring-v4-v6-0-5082a49715ab@kernel.org>
 <20261123-dhchap-keyring-v4-v6-8-5082a49715ab@kernel.org>
 <sashiko-outbox-229752@kernel.org>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <sashiko-outbox-229752@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-14.50 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -14.50
X-Spam-Level: 
X-Rspamd-Queue-Id: 2F32022333

On 11/23/26 6:30 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] nvme-fabrics: keyring=<id> fails in nvmf_parse_key() when TLS
>    is disabled
> - [Medium] nvme-fabrics: match_int() in nvmf_parse_options() misparses
>    keyring names
> --
> 
> commit 1438f3b90feece0503d30638e100925a9591818f
> Author: Hannes Reinecke <hare@kernel.org>
> 
> nvme-fabrics: allow to pass in keyring by name
> 
> This commit updates the fabrics keyring= option to accept keyring names via
> request_key() in addition to numeric key serial IDs, and guards the option
> with CONFIG_NVME_KEYRING instead of CONFIG_NVME_TCP_TLS.
> 
>> diff --git a/drivers/nvme/host/fabrics.c b/drivers/nvme/host/fabrics.c
>> index 2937e5dc9ecd2..aae094bbbf0dd 100644
>> --- a/drivers/nvme/host/fabrics.c
>> +++ b/drivers/nvme/host/fabrics.c
>> @@ -14,6 +14,7 @@
>>   #include "fabrics.h"
>>   #include <linux/nvme-auth.h>
>>   #include <linux/nvme-keyring.h>
>> +#include <linux/key-type.h>
>>   
>>   static DECLARE_RWSEM(nvmf_transports_rwsem);
>>   static LIST_HEAD_GUARDED(nvmf_transports, nvmf_transports_rwsem);
>> @@ -696,8 +697,10 @@ static const match_table_t opt_tokens = {
>>   	{ NVMF_OPT_NR_WRITE_QUEUES,	"nr_write_queues=%d"	},
>>   	{ NVMF_OPT_NR_POLL_QUEUES,	"nr_poll_queues=%d"	},
>>   	{ NVMF_OPT_TOS,			"tos=%d"		},
>> +#if IS_ENABLED(CONFIG_NVME_KEYRING)
>> +	{ NVMF_OPT_KEYRING,		"keyring=%s"		},
>> +#endif
>>   #ifdef CONFIG_NVME_TCP_TLS
>> -	{ NVMF_OPT_KEYRING,		"keyring=%d"		},
>>   	{ NVMF_OPT_TLS_KEY,		"tls_key=%d"		},
>>   #endif
>>   	{ NVMF_OPT_FAIL_FAST_TMO,	"fast_io_fail_tmo=%d"	},
>> @@ -992,17 +995,29 @@ static int nvmf_parse_options(struct nvmf_ctrl_options *opts,
>>   			opts->tos = token;
>>   			break;
>>   		case NVMF_OPT_KEYRING:
>> +#if IS_ENABLED(CONFIG_NVME_KEYRING)
>>   			if (match_int(args, &key_id) || key_id <= 0) {
> 
> [Severity: Medium]
> Can match_int() misparse a keyring name that starts with digits as a
> numeric serial ID?
> 
> Because opt_tokens now matches keyring=%s, args[0] holds the full string.
> match_int() calls match_number(), which uses simple_strtol() and only
> checks endp == buf without verifying that the entire string was consumed:
> 
> lib/parser.c:match_number() {
>      ...
> 	val = simple_strtol(buf, &endp, base);
> 	if (endp == buf)
> 		ret = -EINVAL;
>      ...
> }
> 
> Any keyring name shorter than 24 bytes beginning with a positive integer
> prefix (such as "1nvme") returns 0 from match_int() with key_id > 0,
> routing the truncated prefix to nvmf_parse_key() instead of looking up the
> keyring by name with request_key().
> 
Inverted the check for the next version.

>> -				ret = -EINVAL;
>> -				goto out;
>> -			}
>> -			key = nvmf_parse_key(key_id);
>> -			if (IS_ERR(key)) {
>> -				ret = PTR_ERR(key);
>> -				goto out;
>> +				p = match_strdup(args);
>> +				if (!p) {
>> +					ret = -ENOMEM;
>> +					goto out;
>> +				}
>> +				key = request_key(&key_type_keyring, p, NULL);
>> +				kfree(p);
>> +				if (IS_ERR(key)) {
>> +					ret = PTR_ERR(key);
>> +					goto out;
>> +				}
>> +			} else {
>> +				key = nvmf_parse_key(key_id);
>> +				if (IS_ERR(key)) {
>> +					ret = PTR_ERR(key);
>> +					goto out;
>> +				}
>>   			}
> 
> [Severity: Medium]
> Does passing a keyring by serial number fail when CONFIG_NVME_HOST_AUTH is
> enabled but CONFIG_NVME_TCP_TLS is disabled?
> 
> NVMF_OPT_KEYRING is now guarded by CONFIG_NVME_KEYRING (which is also
> selected by CONFIG_NVME_AUTH), and keyring=<name> succeeds via
> request_key().  However, the numeric path calls nvmf_parse_key(), which
> still requires CONFIG_NVME_TCP_TLS:
> 
> drivers/nvme/host/fabrics.c:nvmf_parse_key() {
> 	struct key *key;
> 
> 	if (!IS_ENABLED(CONFIG_NVME_TCP_TLS)) {
> 		pr_err("TLS is not supported\n");
> 		return ERR_PTR(-EINVAL);
> 	}
>      ...
> }
> 
> In addition, NVMF_ALLOWED_OPTS includes NVMF_OPT_DHCHAP_SECRET and
> NVMF_OPT_DHCHAP_CTRL_SECRET for all transports, which use opts->keyring in
> nvmf_parse_options(), but NVMF_OPT_KEYRING is still only set in
> nvme_tcp_transport.allowed_opts and omitted from NVMF_ALLOWED_OPTS.
> 
Fixed for the next version.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
