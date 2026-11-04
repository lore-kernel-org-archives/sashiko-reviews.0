Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793754339;
	b=M+YH4CNd22Ge50UyQEjTbnwE9M8anUi983+/lO7K+jlAmv/WkMX/2TYqqEMesJymHEny
	 qN0buI4A4b/MYnaRGPzN0l7XzLU64LrsrQFsT80XRAiy4WW7zO7flS8zkS8edSL3AzOsU
	 MhqbLDiYvd560h7z3OoFokNEkx/pp7YhyFYMFJs8qqTEhEIhOUjBUxFZM2O40bfUaCGqr
	 +FVAGanuK+Gp507bG9xsM27xL/QWo+kwVIcb25NmPNaYO/qISc2CD2EZ7IdvZkc21DXrg
	 l9ts4VWO+akuWZyLzTNMgauTr8tiknAxn5iWkGZSpmI99A4rIjJpnv2e97QIGMZv8uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:Date:
	 Message-Id:Subject:From:To:In-Reply-To:References:
	 Content-Transfer-Encoding:MIME-Version;
	bh=OiYsGaoqyzKUnz3XPaxnmXkjL2zBbGhsRecYGJNnKlE=;
	b=H8RtE3GAW5/+00trJavDv4+pDy9DrLO6H75WuetRFkrKMhGWhDDTqV8BsYHbwIj87/vg
	 /640Sverg50Dg37si8BNuRjEAoZY1AbsJQUqZNGNXQ/+L6owQpJcaq8/Lu+S0Zc3rC4bk
	 3l+bjkd/UVJxDc3HH0KCMIlfgHXmHqmiYyxwacacU6U1rHUDogkhTe4QIEjwh6Wr+Bnoi
	 9cf4XiwCBdCbYyrf8/mlk9IJ2WbtbbIZlRr80sdVFHbYqJiEn9QwoxC2sV+8OXIERPVrO
	 3a8U/VWEKmFz3Hm06ABNe9q31WqF2/ZGBkS+k7eLdvkRc1N8ecR5cGwdG5zD8D9tv5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BJwTee0b;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29A2606A31B
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 01:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E29A2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BJwTee0b
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ccca948203aso64373a12.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 03 Nov 2026 17:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793754338; x=1794359138; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OiYsGaoqyzKUnz3XPaxnmXkjL2zBbGhsRecYGJNnKlE=;
        b=BJwTee0bobzLlgZqln0PZjhvcz+qvr8R5gbnFao8/GJlq4JkAk7awfmyk5VaLahQbY
         R25IFL9NYxLei62u65dddZMK2jd43QvJSbP/0ZftLSLCLloRue+V/0/HmSABKZSMc6LY
         sHh7VeneIGhwhD6fY55/PvR8u/5xGklJn7DgmjLuG52Ujq+xWhauvQcJdKdFRL1uHvDy
         YOwjg2Na2/DlIBd2ZTb3sJFPtsdp5YwsMg/OeNg6ok2qdtyd645v0blsfdAdUP8/xYy3
         mK7GyOtxUjt5IUAK7nINs4jzKS9aopBf6MmDBMZJMl8Yb9rZeEfhenO3LaxUTuWSzuSn
         S+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754338; x=1794359138;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OiYsGaoqyzKUnz3XPaxnmXkjL2zBbGhsRecYGJNnKlE=;
        b=q6wS/Ahr36GUvOZ9b6Jq3RpJ1v3XmSYBG7EXW1WdwRoD1w1Y7yxwaPtJiVukBjCKlq
         sC6Y5DrTgZJu9MvpG1x1AM3w/ivxc4zhPWZuFMDk3R59aj5uur4lr6Ivhh/oUXA6BL2/
         R3QgXtmHBa1ptLtbSfyMScJ3iZ0ogzit5j9ibCDfCYxvt7jbc5G2vdh9UANTzRFMhBD6
         MpPXn2Cvdoy6YJ0X4/iD5xBIFo0vWXXCoj2rLr3QjI3ADXkyc8ZFaDjOBT8OLgB4d4Lj
         XRnfosHxhM3xflgBCNsSVM9KGJ9Gj0QG020qUkpYiDBLnj+Tns1r5+AGQbkehAzRFrC5
         WvLA==
X-Gm-Message-State: APuU4Z/VPmZDs1oCkXJ4G5qfTzOA4GtFAWFiFoQdu6IvS5bUhZBg46jE
	b89JYbMNPB2LbWyL6mNpe1vf5MD6KIXXKLpmM3Qw5ZCvzx9HPAVRbiPpfiNPCA==
X-Gm-Gg: AYBFou3QxxSqa9VOWklvwWK+Ma4JSK2nC2nvLIopgONSVtxkNPY42dG7VhFPrXvonKg
	QPS5wabutw5xoaGSD6zku0OS1aOJTP3GRsIvZQF0moihVB/mZoQ3i3Z1sSPc4oab8gXLUWaKq0J
	wJ4nLa9Ru2YaT+ZCV9f48FHKRxHjSeAe+oNtO3WO603lG5mqmtaWYT8TRPzBq4L+wPAMDJj+2Kl
	a0ZyhnHjCjFiMkuD9QLYVk4MYYRaZuWEj6HDfgss2HdhxFKtqtdF6c3vzfSee8Lku+1xRhrA2en
	qXDBrKft0FfBAJa1L0xuF7TKqyr9pY5akvw1XNQXMlnjFyfO2NbaEZF/LjbnB/0FU8Hf/VUVAbg
	cudKAotoMrG0VhudeuT1w28RTf4a+F5xdV8s98UyxU+HywskuDBYxQmhILV7TDujDMBwonCNDME
	NaBpuy6c5PjXta+ufdp95F2n6Kj0HF2ORBKsyQWpGKLppdLdfx52cczY8y5MjlkWkY15NbCYK81
	K7MHgXeOQT7xzxuJzKqr05stjR1m/YrLy3Rqj2RQdNZlM2COjndQ9BjX3WSa3RKwWQjTtrVV9FR
	uxsxjc+zmqfhGD9egehVDiS+WINkZbnafI1jwoGHy6O5cIrANBUaZXcP7Ox1ftWvILnM0EZJpgw
	jSvYpEFtP1GInGhi+qz1dnAqsif4NyPY/rw==
X-Received: by 2002:a17:90a:8398:b0:3b0:9984:18c9 with SMTP id 98e67ed59e1d1-3b0998422c1mr181065a91.11.1793754338082;
        Tue, 03 Nov 2026 17:05:38 -0800 (PST)
Received: from localhost ([153.61.198.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0944d1a43sm1272825a91.13.2026.11.03.17.05.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 17:05:37 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 01:05:37 +0000
Message-Id: <DMM0UEKUOMVQ.18RYWJLVRPXUR@gmail.com>
Subject: Re: [PATCH bpf-next 06/37] bpf: Count stack arguments of a static
 subprog from its code
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, <bpf@vger.kernel.org>
In-Reply-To: <sashiko-outbox-196294@kernel.org>
References: <20261103234104.208239-1-alexei.starovoitov@gmail.com> <20261103234104.208239-7-alexei.starovoitov@gmail.com> <sashiko-outbox-196294@kernel.org>
Content-Transfer-Encoding: 8bit
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Tue, Nov 03, 2026 at 04:14 PM sashiko-bot@kernel.org <sashiko-bot@kernel.org> wrote:
>> +	stack_arg_cnt = bpf_in_stack_arg_cnt(caller_info) +
>> +			max_t(int, callee_incoming,
>> +			      min_t(int, caller_info->max_out_stack_arg_cnt,
>> +				    callee_info->arg_slot_cnt - MAX_BPF_FUNC_REG_ARGS));
>
> [Severity: Medium]
> Can btf_prepare_func_args() leave sub->arg_slot_cnt undercounted when it
> returns early on a static subprogram with multi-slot parameters?

[...]

> using the parameter count rather than the slot count. Because this
> undercounts the prototype's stack argument slots, wouldn't
> bpf_fixup_call_args() reject valid caller stores to those trailing stack
> argument slots?

Not from this patch.
bpf-next has arg_slot_cnt == nargs after an early return too, and
bpf_fixup_call_args() rejects the same store with the same message.
bpf-next also rejects the load of such a slot in the callee.
