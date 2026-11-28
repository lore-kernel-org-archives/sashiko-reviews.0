Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795832208;
	b=m7YUapB/MLC7cl4hgKQlz2JjqhztJs4IE4iALD1FbKQlTRS0XyBwBhRkMK58OaU6AoZw
	 D4mOG9+EUCZw9sFDvm127ugacjyyegckdthbH/SjF2jqvt/Z3QRp15GsKhgEl02k70KMD
	 hHTwqZzoBhB87rcR77fG49XZjhQ35FCofK0/eYOMnkbKfEfNNPzXqbl2e476iCzHVI6G/
	 O/AsRc7ycablJefuvKIH19h+aY+gWT51FeJqUlF8jRqyGPeSK0SPqmKaaFxEoEMGmVnB8
	 ekT1i2mAvmE5K77v5jUnlFHsWq6CYiQ3yGTyG8yakV47wQYOq5hkOd117dv8mdWq7Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795832208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:X-Mailer:References:In-Reply-To;
	bh=yiliGXm3f+G64tFZg1ZTzyN0pIV3IaS5Gv94kJDg6uc=;
	b=H77MZI+LDLu+0CQiuI67dqKJcpxjDyHh7vfMRb8L+g/k4G1+n072Df01hZkwLK5IH8y9
	 bfRcXmbgGGRq71sqgIk+KBHOAYyoYl8cqVbZdfBnnlSGTKXKbSrzEdkumTAsvOlk6b/6a
	 ukLdW0PGs34M+zyf6ydJP1WrR5bl8BAysN0SQA3IyXrq9ZhmvMlntYmTwmSZn+8Uu9CuR
	 c6uBkr5Xpov5rSW5g1HDdWoPCBJqvgcIEkS5Er88YUsRSRzFqEUBFY4nRII2J5Ijd60Yb
	 CTKL2aTssKgJNHg24wUatUwmdIv8X+CokvOKjJc7mQMZFSaNt3yUYGS7RXDQvkxH69A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MKCybWSe;
	arc=none smtp.remote-ip=74.125.231.128
Received: from mail-oo2-f0.google.com (mail-oo2-f0.google.com [74.125.231.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D53B606A68D
	for <sashiko-reviews@lists.linux.dev>; Sat, 28 Nov 2026 02:16:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D53B606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MKCybWSe
Received: by mail-oo2-f0.google.com with SMTP id 006d021491bc7-71b2566b798so794705eaf.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 18:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795832206; x=1796437006; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yiliGXm3f+G64tFZg1ZTzyN0pIV3IaS5Gv94kJDg6uc=;
        b=MKCybWSetVRkbK0xxTlT33zddckXsiMEji8JErzSlJPJdrAFgVIxHRLHv/GHJE0IfT
         5WudFrv1Ijic7ztNSj694V7wxRupw/caUpKQWHpAzTWeB34ZOOfbmMQMTJahJDQQD43S
         dg6mob3ieA8JBO6w/unPFOxU0Kx/RAw7UcGK4y9B8i0++J6Pjid4/Nztp/a4VNpX40v3
         MRAvBncoB4PlVQiFoqewcDJv9rbFU3tuPHv2ph4zBKv2NJfYipsSch8giPc1uFMyFDuC
         ZADOL/7WzHgmSDpSDvzmc/zGRSTEYDuCENCT2bMCx+2PxyNN4E2oYMMCEl1DuA/jQxNO
         dwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795832206; x=1796437006;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yiliGXm3f+G64tFZg1ZTzyN0pIV3IaS5Gv94kJDg6uc=;
        b=Fi/D7l7ODG07wxKNRSGUXATE3AXZpQ2TMjMczvnHeHkpmm6p4zuhRuTsXQxrfRKg/i
         U3BBEcXYU6rqt4fqcs1djF11SQRMxRPADKEc5/Mp7jdouCdPI+Xzo+gjHZF7O4Jwl4gL
         avrudXsGYRGuoeyTL7Ctr8sVT2B9sVVCDAKbo6Brcco/X23X9KAuvjTe/PTTO0o7lj9E
         7SBYSpmfVWXE9gRIxkUI2FY/D7lM7xV6blfrpqfXDCV5yAmz7q3NitQR/OyZK5lP4C8y
         byysFNuG28nzSehXibHsTCp4zftx+PrmoEIQ/lkDiQEfROlooZdW6lmmlTTlXty0cxJp
         WBPg==
X-Gm-Message-State: APuU4Z/TAIRaBmKxAIIBGi7GdqPj0oTu4ayHoXXM5PPS6uFPSYcrQT/I
	HQ0WjoPb6kOZMkFK03r3RilHsAMZplGMEo/lOdQZvsEIXHtqztzL0hwvAhrDBw0119o=
X-Gm-Gg: AZFdTZd2UAwliQESbAaaS0k72tqvSmdU9Kpion41iDWCTemWrZTdD253iPSp/mUWbdA
	rdIZ7hkgcSeS+0NdJCX8NHm8UJF0lUzu9lCmX9AAo0EmzLl7QdUCkapgFGcp6ARVk1qzhVGQS5Y
	+yjvbKrhDZFgjLbNn2JEmiDLCdQzp3KuUe86mA3xXeYyGcGlLkZSTLmccD1NlGSFNHt8h7ENrrM
	68VGeXmxsygEaeOkNRoccYdU49YQmS1bWs72KnHIx9V8HqGpr3tue8x4ld3NEum5bYGINVPDqp7
	QwdCeNjWpXbIL3/PNYexUi+dI8jIyx7M4ES+yeql3HvkCp68nzrMOX31jO9CQ9v2uU7d4KQ3jH2
	3RKRDl17IcMUia+NoQxH8/BPJPwDWmDXJqJ/EQ6bCHfJ67cizrPq9zpyoQP1fCF47NdPT2DdG4W
	dcoD/pI5YxHXBzKqkdvuN8Sibo4QmfXhSKPAnh4HUU+ISqwQD0ZGwtc+icVp9H8BzCCPEX48cMJ
	Q486ccrREzeKoKbCeCj8McufMbpOHB8iraY0hfTAow8zWRppdTRXtywpAFjN9QUyFVH7+rIbmdI
	8i2SebkJC7xLYgWiaHh0x9mKrlne2PV6oDyKWcGonI97OKMbs26Tor83uXWTgQpHr7Z+A4YaBTr
	uJoZ8wJv5w2orrIAbQGIhegzY29E4TrRYzA/1+g==
X-Received: by 2002:a05:6820:c5c6:20b0:71a:fb34:af74 with SMTP id 006d021491bc7-71b39438914mr13911055eaf.27.1795832206071;
        Fri, 27 Nov 2026 18:16:46 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:5b::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc60891cf6sm24863163fac.13.2026.11.27.18.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 18:16:44 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Nov 2026 03:16:43 +0100
Message-Id: <DN6HDX0GXICR.JK53Y1GEJOTT@gmail.com>
Subject: Re: [PATCH bpf-next v2 2/3] bpf, x86: Skip the PROBE_MEM address
 range check under SMAP
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, <bpf@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <cover.1795829324.git.memxor@gmail.com>
 <f2beca95aa1eb81f00c6baf408c681063e13ce83.1795829324.git.memxor@gmail.com>
 <sashiko-outbox-238410@kernel.org>
In-Reply-To: <sashiko-outbox-238410@kernel.org>

On Sat Nov 28, 2026 at 2:41 AM CET, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] bpf, x86: skipping PROBE_MEM range check breaks
>   flex_array_far_join() test
> --
>
> commit 519a06c0e9f33f01690a25837946e3048111ee57
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> bpf, x86: Skip the PROBE_MEM address range check under SMAP
>
> This commit omits the x86-64 JIT runtime address range check before
> BPF_PROBE_MEM and BPF_PROBE_MEMSX loads when SMAP is enabled and the
> program was loaded with CAP_BPF, relying on SMAP and the page fault
> handler's exception table lookup instead.
>
>> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
>> index d51ae52fef719..019e5da72136d 100644
>> --- a/arch/x86/net/bpf_jit_comp.c
>> +++ b/arch/x86/net/bpf_jit_comp.c
> [ ... ]
>> @@ -4862,6 +4870,15 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_v=
erifier_env *env, struct bpf_pr
>>  		addrs[i] =3D proglen;
>>  	}
>>  	ctx.cleanup_addr =3D proglen;
>> +	/*
>> +	 * With SMAP enabled, a PROBE_MEM load of a user address faults (#PF, =
or
>> +	 * #GP with LASS) and the fault handler resolves the exception table
>> +	 * entry of the program, as for an unmapped kernel address. That looku=
p
>> +	 * only finds programs in the BPF ksym tree, so programs loaded withou=
t
>> +	 * CAP_BPF keep the address range check, as do kernels without SMAP.
>> +	 */
>> +	ctx.probe_mem_check =3D !cpu_feature_enabled(X86_FEATURE_SMAP) ||
>> +			      !bpf_prog_kallsyms_allowed(prog);
>>  skip_init_addrs:
>
> [Severity: Medium]
> Does skipping the range check break the flex_array_far_join() BPF selftes=
t
> on x86-64 systems with SMAP enabled?
>
> tools/testing/selftests/bpf/progs/verifier_btf_array_access.c:flex_array_=
far_join() {
> 	SEC("tp_btf/exit_mmap")
> 	__success __arch_x86_64
> 	__jited("	leaq	0xa00000(%rbx), %r11")
> 	__naked void flex_array_far_join(void)
> }
>
> That test is loaded with CAP_BPF and matches the "leaq 0xa00000(%rbx), %r=
11"
> instruction from the PROBE_MEM range check to verify that the load was
> converted to BPF_PROBE_MEM, so its __jited() check fails when
> ctx.probe_mem_check is false.

Yes, this was an oversight on my part. Will fix in v3 respin (after some ti=
me).
