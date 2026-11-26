Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703574;
	b=OlwQWGztyCpOcDZJI+26awlYGiGIOFMF/W7M1tg/s+tSlYzkHwPW619loUYInvIgYRAg
	 IjxGRrsKRvrEzQV2qmtZxbUHOydgwA/r3hQBNEbRXVgylMGX27zAauSgvI7XTLys5i0sZ
	 +45y7JUg2y/m71ZBmtWDS59969bc9WszQ5jC3aWETPqyZYL8ymEDAnkJP7K0h2IlvCh5t
	 A5vH+er+cdQEebVbg42bMvi7gYhBT8mXefq8LmoO0F79u4JzFHgcLMArumEN8ua7rU+mf
	 0Y3FNAiZUrCPH15O8MZS8l8vmYz2ipN6IDrhNywIPue+i46Yd9CjnYqtHSYnwfcdXYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=dNB1mnKPKeMJ/SMSzjMxKWB4upzMQxhzI2dJe9ubtz4=;
	b=hBNC3elgDjoGDGDTuEx37K6OENa/3o/kjZ1CfUxGOwQu1sh6utiwRXzkhcqkSQawbusa
	 7NBltR3Mq4y+hR45WUfxDvMj74qvweFUus4DZzxuvAG1xsEIBn436ZhdkhKWDT+NG+MV3
	 oHjsePOHEugv7yeYI3HlyaTbZQBheukYY2GVu72u+XdIkbdfrAPHxpqaW1AO6qsBosJ2T
	 DEqXaafxBE23+Ytf/lx514hsNtPv8xpb5gRuepzktHJW0K4pvUVBOcr75JzU4bZBfxd0m
	 sXfDof7L+N7i9DjYyPUx4X3xhW6otbb60A6YjXuSBbb8r7Q3KXZp0ix1biGnAKMmSNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lhkRQRNM;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C630606A68D
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 14:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C630606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lhkRQRNM
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso65875005e9.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 06:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795703572; x=1796308372; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNB1mnKPKeMJ/SMSzjMxKWB4upzMQxhzI2dJe9ubtz4=;
        b=lhkRQRNM+BasKjESoPd4zNeNKLuJ8oG5qTHQkVDu59Ojcfq9TQh790DvZjUj5D2ElX
         +t0XNb09adLqse8a9fLlWDoFMWw/WXg9nbM3XB3LxHQfNu1U4XPFvOvYpgQ2mvr+gtP9
         9LcdI8pIjjAB8rDiHtEQBaApzoE7j7f/DXYOHKTHDewcgkRMX4aNKeDt+Pk6WYOhMLYk
         eRbeNfA3BFWBH2bJ1YjCOcxYgjAH7zvu3p4Lu7YnC15gcvg/cELZwUsndZyDfzSdzkMn
         Ajrva3zPag4kvpkZcE5URt2Ma1GTC4aQkB/UQwZcl4PiTAL4DltfFJKxwySzNN9KZszF
         iGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703572; x=1796308372;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dNB1mnKPKeMJ/SMSzjMxKWB4upzMQxhzI2dJe9ubtz4=;
        b=kYWxXWEEJOmlRbMvny14T5rbS0nsTHbtpAINW2Dnk+RJTlxc9m0YVzxqU4UMASZSRu
         WJADbKInFDYuwPfsS+0iEUcQdnaOKcO6pK8KAq+CXk8Ek8X+E9CBSeiB6LdjrALLk4rx
         uwLmbEFIFVEVupqvv83N37XiRO+0RbwigJb0ZEcLDDyxUSyZYZVsYutQkZ0xagTxrwr4
         fSWMI85HhAnX+R09Qqag02yc+mzemdMo8dn/A4/+M+zkTJ24a9LhTshTfXmR/am0cpVe
         VGonfwzgCRHo+qjn11XE6R1FUz54mIf4BGdqmaWjjptN1ugVu7yvtyRGTgGEdKD7zxS8
         i7wA==
X-Gm-Message-State: APuU4Z+DpEexkYUwxmxhsOXlBNALHG0aGWczfpvPojMu/yDbtWxn6egF
	h6s4xcNfhmMzbDGgycC7GcGZTmatl5Kcp/d55HR8IrPZ4h2Zll3KOfmedyCe1Q==
X-Gm-Gg: AZFdTZcv9PNVhwTJ0SOQzdnGtmovNTLUt7kDNG6w8Wgl5L9HQjuoq1NndAtAzdyHjxJ
	RxCV7U6Y7t6Qrr+oWRpmksGZ09gy1uaG3S1/7njbfynDPKDpvGRaBhLGgWqiDZOyqK8XOq/lfao
	Iwtlw/HCZYahsqqF043C5q1E0B3tSuWSDmeHCU7lIrlunwsmmOVXMAbOQJA5OImbpHLiGpwT8Mv
	9GEPz22CpeXg/4utQvW4fUnktyp9jdOA678huf4biyqL5qodx+c24V7sBUdoFzZtXefY2hxwxf3
	I+o9udJRoNnxbDXkLn3dobJyB/E6rbrDYDgp0p2Vjha1nOkh8z+A4V2D2qZiLnTMrqRKfO22UeJ
	P3kEd+ho3G8khiObvEgLIVjIsqTbdDSOQ0k8pD2fRBxouYgedfRvWa7fdGkjVCk9FthNovgvF9q
	chzI/fpj+w8vV8/T6/1UQisHmHhZGPZ02AU2okENt9FwHjSxRMUdPFeSwJvSw0SbpJJsbxX5NoN
	2oZAPlf4BpcufWYFG1YgoOGw+MIAjQQ/ymQ2ns6hVNfqsMc8W3SN4+WUoWEv0LJrBgvEu2ovlI6
	fI+DeZ13TDoqzwL6qo0GJ0IM02XA1KEYJQP5JA==
X-Received: by 2002:a05:600c:848a:b0:4bb:6626:5a25 with SMTP id 5b1f17b1804b1-4bb88813462mr365525275e9.20.1795703572435;
        Thu, 26 Nov 2026 06:32:52 -0800 (PST)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm600501465e9.1.2026.11.26.06.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:32:51 -0800 (PST)
Date: Thu, 26 Nov 2026 14:44:29 +0000
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH v2 bpf-next 4/7] resolve_btfids: Exclude a set of
 functions by name
Message-ID: <awhFzc36w88ke3qL@mail.gmail.com>
References: <20261126142915.1106330-1-a.s.protopopov@gmail.com>
 <20261126142915.1106330-5-a.s.protopopov@gmail.com>
 <sashiko-outbox-235699@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-235699@kernel.org>

On 26/11/26 02:26PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] bpf: missing Fixes: trailer for fmodret_tag() function exclusion
>   fix
> --
> 
> commit 2fc421479a0ddf21d6c174ca83ce8384475f3b9a
> Author: Anton Protopopov <a.s.protopopov@gmail.com>
> 
> > resolve_btfids: Exclude a set of functions by name
> >
> > ftrace reads the code it patches with copy_from_kernel_nofault(). A
> > program which makes it fail breaks the detach of fentry on x86:
> >
> >   unregister_fentry()
> >     update_ftrace_direct_del()    returns 0
> >       ftrace_replace_code()       ftrace_bug(), no text poke
> >         ftrace_verify_code()      -EFAULT
> >     bpf_tramp_image_put()         the function still calls the freed image
> >
> > On arm64 ftrace reads and writes the code with aarch64_insn_read()
> > and aarch64_insn_patch_text_nosync(), which calls
> > aarch64_insn_write(). They are traceable without KPROBES. The same
> > holds for them. Two more functions break BPF after a skip:
> >
> >   target                         error    after the skip
> >   -----------------------------  -------  ---------------------------------
> >   copy_to_kernel_nofault()       -EFAULT  arm64, with KPROBES too:
> >                                           __aarch64_insn_write() fails.
> >                                           ftrace_bug(), no text poke.
> >                                           text_poke_memcpy() ignores it.
> >                                           bpf_arch_text_copy() returns dst.
> >                                           The new prog is all BRK insns
> >   tracepoint_probe_unregister()  -ENOENT  bpf_raw_tp_link_release() ignores
> >                                           it. __bpf_trace_run() reads the
> >                                           freed link
> >
> > Do not tag these six.
> >
> > Signed-off-by: Anton Protopopov <a.s.protopopov@gmail.com>
> 
> [Severity: Low]
> Since this fixes unsafe bpf_fmodret_retval tagging in fmodret_tag(), should
> it include a Fixes: tag?
> 
>   Fixes: 4dd950adacad ("resolve_btfids: Tag the functions that return errors")

Same. Will add it if another version will be needed.

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261126142915.1106330-1-a.s.protopopov@gmail.com?part=4
