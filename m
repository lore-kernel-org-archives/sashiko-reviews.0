Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793123336;
	b=yRiZUvW4QPJa7XlZnib6F9E+9/N1kxtODALAJjMlw9ZAwtGQ1Lu0YK7tMxapVsXHTZi6
	 437ZszXUIwguTUJNfCEuzlqrUe9GVJ8DMOUtbiIHaQLRrJ3ernzYR9Q6UGgsjKpKg6vDa
	 FmJgOMwnef9PpsdytLVV3sDQtMsgmBuV3lXu1P/0BV3MPChpV/Xdat0lALSdduYHu2FKh
	 nY5t02dqxqpCQYbDiqnVeUhOMvP71s+ak2ESfI65+/k3aZDWZuuN9LpK8G4EmjLUQliJt
	 j18qQoVUk238ZI+HB8xY2mzKOOZWrpMF8tsoSXc3pBj9pm+IVAaWySSafUpVu/BgM1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123336;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=AbNTlVsoW83vd1Gm5siP6xoBuKJZ+AJ6STSqDpBdTLs=;
	b=imyKBibD04hT2SJNdWPKYhmzbOLxwywcV2e5k76k7+q4jAuSIbY8YzTxTBZWv2IaFJQy
	 4e5MdnPOPGm/TDGIEzNFy3FvjdgANQaRhT9dDsIwWuVpQ2VKlN76Kd5gk9jISAMKpy6Cx
	 jtYx3lmt9FkVirg1QEB7DQMZXjxwi/TGpLiCgoXF2fo9pA/RcddGdAo9TXJCBzd2GZJ1U
	 AvH7tGRl6/vzgkezw/kkTjEBFJIej0kSQ+W/ANs/WdCRSTBJeeRsnBkxDBxLMqNyfUPei
	 mrwv8Jk40cIzWtOq6qDZ25tHX1Jfxj/NLgbYm79+muuTZMwY0Cidd/YqqWcK8s8wTAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="fqcSZ/lh";
	arc=none smtp.remote-ip=209.85.222.226
Received: from mail-qk1-f226.google.com (mail-qk1-f226.google.com [209.85.222.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27CF606A31E
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 17:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B27CF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fqcSZ/lh
Received: by mail-qk1-f226.google.com with SMTP id af79cd13be357-93cbc3ab2fdso890285a.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 10:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793123335; x=1793728135;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AbNTlVsoW83vd1Gm5siP6xoBuKJZ+AJ6STSqDpBdTLs=;
        b=f8YAjmUsdXCyEKQmltysXHm4pdD1MH+hCQN0wYXRUjH2Aq7qslSWPt3i74M84OgH03
         X2M5vpMpNvS8h+S1UEnTVxJ4NrvmCEOyNlnsQSu7jf9bevR4Im+vJXJtxtiqTlckeqZU
         Bh9rffdFSoEFwAMn4CCyIxGFBAwG6BzBcxfts9UI0Q+zuARQQAuThiqQk1CSlflVU396
         zS4RUyII3LhnXI/dFUzjr7BGzM07yOLVgLIS/h8f236wA+cyi5B4N1jpH9pJSeNAVaYD
         QDXl+LWjOzyaAo74Z6sEpnyLfSjymIR/pQhEtcrnk763AUdkkIgwvc3RNfq8ELzcPVQe
         CU1w==
X-Gm-Message-State: AFq9FYKCqNPhx4p0j+mzqPpVeYIG448puzbtqtPAfuKfRnZNR56pHJtQ
	w0CAEeH29tRFAVRQdNPza7KKw3eJ40PDkXL+y03nWrKWCbxlvKpkDQrfsHlVsZNCXnxJC0Gtsq7
	eIFTdVCthaOuwDVX03p4m6aMSXJMijOjAb/IUWO407LYcYI07QYhWm5I1W42b48RA480M+BCFdQ
	TpBnX4RWbWW+F0/z3p7kMsTRkzpMI3YJLgMxau1B2TlgIP8LHWue2XV1Q3vRtQYoolT3aliPdqd
	YhIWCfUBKDoVSqPGP2QD1aNfjMlbEw=
X-Gm-Gg: AYBFou3Oopljfw69TDHD8Bg5NJzAaMRMLX6cXxZzfiPg80bJEgjUgpiLDDpI32RG7dw
	ho2I0SND1PgZrLcWOBfX8Jx8U6GTTjPtnhS1FtKmHSksZmh02yQMu1sHwaR4qheyUvqXY5+ggd4
	Ur32QDAEOIIr7GFPIK/DzlispnuEOcUOBxre09JM0TNXxoUDzZN8f3fNzcn6pwofmM8zLHfwIJq
	ru5sqYqihwDrUPyGuInTLbUF7SuHI/GAfDaH+YQFQ3qFu393SFF/DvldBNzmAVuPGrU5IegFluC
	lL5PKe1sCxbDf52PDSrZPnakmS1eSO88QsxXTQnm9RzL69T8o4k6yWhymRShpl6Usf9IiAcKPx6
	mbePGLkfWY2imPVlNeCDNjxDoHD6dklDpzRFO7+RKnSit5pSRsrbf+9K4ly4XwA6VFOKGW8L/o2
	9SGD7GakctfrZ5asGc0WW+AWK/+uXfSFWzI9sa/y1U
X-Received: by 2002:a05:620a:2904:b0:93a:2221:5460 with SMTP id af79cd13be357-940ef95267emr1756742585a.40.1793123334546;
        Tue, 27 Oct 2026 10:48:54 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-940f0674580sm155247685a.7.2026.10.27.10.48.53
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 10:48:54 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f559420f3so3877085a.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 10:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793123333; x=1793728133; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AbNTlVsoW83vd1Gm5siP6xoBuKJZ+AJ6STSqDpBdTLs=;
        b=fqcSZ/lhnsBWNAds0TyZp/OYmXpU2U8Bwj58BJ5MGvYgGTREcWFSyB9ChYvbXYRqmN
         OvMLlRyKYsBEFWPr6R+J2Y/EXbXv/BrVQN+96LQsrB/xNzgmqc2jxoyY50887xIvJwUa
         iaAVQ/hLbCMD151jjve3KriBnyijLrdhPHGvA=
X-Received: by 2002:a05:620a:a883:10b0:940:f224:5a69 with SMTP id af79cd13be357-940f2245d1emr1151488285a.65.1793123332927;
        Tue, 27 Oct 2026 10:48:52 -0700 (PDT)
X-Received: by 2002:a05:620a:a883:10b0:940:f224:5a69 with SMTP id af79cd13be357-940f2245d1emr1151485385a.65.1793123332331;
        Tue, 27 Oct 2026 10:48:52 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-943ff45bffesm137286385a.15.2026.10.27.10.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 10:48:51 -0700 (PDT)
Message-ID: <9a76bd76-54c5-4a5e-8b61-dfcc9d696fe6@broadcom.com>
Date: Tue, 27 Oct 2026 10:48:50 -0700
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
Subject: Re: [PATCH 2/3] perf: Add Broadcom BCM5301X AXI Trace Module counters
To: sashiko-reviews@lists.linux.dev
Cc: "open list:ARM PMU PROFILING AND DEBUGGING"
 <linux-perf-users@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
References: <20261026211151.3212237-1-florian.fainelli@broadcom.com>
 <20261026211151.3212237-3-florian.fainelli@broadcom.com>
 <sashiko-outbox-185750@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <sashiko-outbox-185750@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/26/26 14:24, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] perf: bcm5301x_axi_event_init() calls for_each_sibling_event() with NULL ctx
> - [Low] docs: perf: title underline too short in bcm5301x-axi-pmu.rst
> --
> 
> commit 98ec05a97143b2d8c2fd04e15999d3fc2b116134
> Author: Florian Fainelli <florian.fainelli@broadcom.com>
> 
> perf: Add Broadcom BCM5301X AXI Trace Module counters
> 
> This commit adds a PMU driver and documentation for the Broadcom BCM5301X
> AXI Trace Module counters, exposing 16 unfiltered fixed counters through
> system-wide perf events with hrtimer-based 32-bit delta accounting.
> 
>> diff --git a/Documentation/admin-guide/perf/bcm5301x-axi-pmu.rst b/Documentation/admin-guide/perf/bcm5301x-axi-pmu.rst
>> new file mode 100644
>> index 0000000000000..720f042dfbd0b
>> --- /dev/null
>> +++ b/Documentation/admin-guide/perf/bcm5301x-axi-pmu.rst
>> @@ -0,0 +1,92 @@
>> +.. SPDX-License-Identifier: GPL-2.0-only
>> +
>> +Broadcom BCM5301X AXI Trace Module PMU
>> +====================================
> 
> [Severity: Low]
> In Documentation/admin-guide/perf/bcm5301x-axi-pmu.rst, the title underline is
> 36 characters while the title is 38 characters. Should the underline be
> extended by two characters so make htmldocs does not emit a title underline
> too short warning?

Yes, will fix that one.

> 
> [ ... ]
> 
>> diff --git a/drivers/perf/bcm5301x_axi_pmu.c b/drivers/perf/bcm5301x_axi_pmu.c
>> new file mode 100644
>> index 0000000000000..15da137a40859
>> --- /dev/null
>> +++ b/drivers/perf/bcm5301x_axi_pmu.c
> 
> [ ... ]
> 
>> +static int bcm5301x_axi_event_init(struct perf_event *event)
>> +{
>> +	struct bcm5301x_axi_pmu *axi = to_axi_pmu(event->pmu);
>> +	struct perf_event *sibling, *leader = event->group_leader;
>> +	unsigned long used = 0;
>> +
>> +	if (event->attr.type != event->pmu->type)
>> +		return -ENOENT;
>> +	if (is_sampling_event(event) || event->attach_state & PERF_ATTACH_TASK ||
>> +	    event->cpu < 0)
>> +		return -EOPNOTSUPP;
>> +	if (event->attr.config >= ATM_NR_COUNTERS || event->attr.config1 ||
>> +	    event->attr.config2)
>> +		return -EINVAL;
>> +
>> +	/* A group cannot allocate the same fixed counter twice. */
>> +	if (!is_software_event(leader)) {
>> +		if (leader->pmu != event->pmu)
>> +			return -EINVAL;
>> +		__set_bit(leader->attr.config, &used);
>> +	}
>> +	for_each_sibling_event(sibling, leader) {
>> +		if (is_software_event(sibling))
>> +			continue;
>> +		if (sibling->pmu != event->pmu ||
>> +		    test_and_set_bit(sibling->attr.config, &used))
>> +			return -EINVAL;
>> +	}
>> +	if (event != leader && test_bit(event->attr.config, &used))
>> +		return -EINVAL;
> 
> [Severity: High]
> When userspace opens a standalone event or a group leader (where
> event == leader), can calling for_each_sibling_event(sibling, leader) in
> bcm5301x_axi_event_init() in drivers/perf/bcm5301x_axi_pmu.c trigger a
> lockdep warning or dereference a near-NULL pointer?
> 
> In the perf_event_alloc() -> perf_init_event() -> perf_try_init_event() path
> in kernel/events/core.c, leader->ctx->mutex is only locked when
> event->group_leader != event:
> 
> 	if (event->group_leader != event && pmu->task_ctx_nr != perf_sw_context) {
> 		ctx = perf_event_ctx_lock_nested(event->group_leader,
> 						 SINGLE_DEPTH_NESTING);
> 		BUG_ON(!ctx);
> 	}
> 
> 	event->pmu = pmu;
> 	ret = pmu->event_init(event);
> 
> When event == leader, leader->ctx is still NULL (it is only assigned later in
> perf_install_in_context()). Calling for_each_sibling_event(sibling, leader) in
> include/linux/perf_event.h expands to lockdep_assert_event_ctx(leader):
> 
> #define lockdep_assert_event_ctx(event)			\
> 	WARN_ON_ONCE(__lockdep_enabled &&			\
> 		     (this_cpu_read(hardirqs_enabled) &&	\
> 		      lockdep_is_held(&(event)->ctx->mutex) != LOCK_STATE_HELD))
> 
> With CONFIG_PROVE_LOCKING enabled, this passes &(leader)->ctx->mutex (an
> offset from NULL) to lockdep_is_held(), which triggers the WARN_ON_ONCE
> assertion and can fault in match_held_lock() if any held lock in
> current->held_locks has hlock->references != 0.
> 
> Should the group validation block in bcm5301x_axi_event_init() be guarded by
> if (event != leader)?

Thanks, this is also valid. Group validation is now guarded by event != 
leader, preserving validation when adding siblings while avoiding the 
NULL context for new leaders.
-- 
Florian
