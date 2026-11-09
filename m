Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229493;
	b=q3i/2S570r9igaPwrLEdsp9LnidA2VXSIjIE6IskGenZjAfncpTjDRu5uTdHeSeoNHFm
	 KprqUDxLTOLFTfdMy3V5pYh4ervUquMPDnHg1tn3X0huLFt8+acf1CXSKDyRe4N8Wwa8G
	 srhbmgZmSfNNK2Z/JE3CWzCoG/eXrzjPl2X95sulnxA8B/8bCeA7UhM3mvchjgZ6Niv6b
	 vMUyYNySFOkk5yKPNDlvw64+IhxPFAb73XcMkEjv38svbKBQsUgUDC9xg7bRjNph9KCAn
	 76hu5hoORmNbbpeATrZ5Y9Tj61V98N0+/aT40/XLxnr0ZuqlWPhoqHQJOc8qT56Hy3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=V6AbWD+Qg2sAj80uwGcxzlirL7Nk8T9JdNmNHXSXbg0=;
	b=1nQSbYu5aAkLTRubN/B51Q1DOcZTolXInvSpxUGDXeLG0jGpaZRgmHziV8YVWmbg6pZE
	 LJOHk1CPW7vf9M1Ii5uQ5siuODIR2esM2/aimHnYDof/YITtw3OPPXnJVwDJfQrfkf9YJ
	 DcLP2xxRlAuZ3BXh7a9+46TxQHrWf0FUWDtjfOWdP2YVc/HK7psftQIF9SDp1Rx5uC7zU
	 yooamL6AulDiEi7Z7dp+PsTkXfZVSg2SrPr90qtfa/0edKc77ckT6CF0lQTkGICAj6f+m
	 pmjKOp3zLF5xBn8puF0XaPXF9ygWGevUi0apYbp9AJABjfVCIlcheD4AhKxNMMGwkzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dt4ekAf8;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A2B606A325
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 13:04:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5A2B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dt4ekAf8
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c49b431f022so138805166b.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 05:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794229491; x=1794834291; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V6AbWD+Qg2sAj80uwGcxzlirL7Nk8T9JdNmNHXSXbg0=;
        b=Dt4ekAf879piUB9hn5vMa4EWZTKqTGEFjejUX3jmaxYk33XUeZYSelxtf06lgLaHbD
         WY1go9boYi0H3hnKIR66fmBS4Ai5SQVntvKfIlIJAYcOjbCIaiNv8zcWGnFLrRMuUpQM
         6NvIirsLyiZCpDKL7gNtKmjohKaoCfdYV1ESND0eJw90V4AOlRcTcUFbXbZVs1+pdhqV
         2vIvhwsj1PqgSPM0QCWyNdS2169pobVMwt5YzTdy2Q3U5TPcbRn3yZCU+Ao0WAEiICE2
         SLloxQtXn4iCVsoJ0yduS1kydvwwZXrN6mTQqwjJTttuKr95bRFD/H8W+vcVhzBRCVJ7
         hqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229491; x=1794834291;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=V6AbWD+Qg2sAj80uwGcxzlirL7Nk8T9JdNmNHXSXbg0=;
        b=Yqibsgwt/SLqCUhv55AbUuYFBdKMK6oezsfs+fa/8oyXC7Wnj8xtHRXAGOEvVrhW9o
         4CXZOnp3fR2S5C6pYg+U3dD1NpDE/uDaC9iJzyZURTyRR8s85fvvCgvlZdqDNLGLqSHX
         c3Y8PJ4MN9Rs9zkTRTfsT3QpoNgve21xAHmYd4Ny9GR/bAnXfcUT+xrh2wisfmoHjBqD
         Uzy60wsFXTQl6eGHKnhgdIk1OaKb3wRJg7eEWSwNGmBIP+RYbRwiA2IeF+AOjIfH3SyU
         onKvsY8P1NL/JBDB1HbW5LjGuDyo4EK5NWVBuf1t4/7dokPochcj6Jzlyn6nvU8NkQJn
         IqYA==
X-Gm-Message-State: APuU4Z9YSayXKgdPFO92dEs9ejdyISBgTwclLm8OZB0gWXjzYeI2PuId
	uqv+LnTBAYEOc8CAncN30zIswtNx8f765UZGjqijlJsrKGJYrRI6Onqp2L14Fw==
X-Gm-Gg: AYBFou3PRm7GpXubXiwrtz8rzCFeVQkYbqbQHbLvaafcVcAVB32rI2AkqRLmL4Ec45W
	yVb+xIeh+eXEPEAburUGqkaMY6BiiEHWMmsfmw8knbpxhEL/DwJFwp+mV9u/qxyuJyTBv5Z/7oT
	MAoSGAP8ySW89GfUKofg4Uw2YVrOGdQDUOpW+PzSq35tUP3YgiHa+8muR15PsVjQTziztUwUXDJ
	Peqr9w+p3QLOVlJkkE5JTq3Fb23uSxBz2aJq/u9It+C0jFmUvVhbW8zZYQSzwS7dtu19XNJuUAi
	kEYb9R+EWXFSfarK2xIhLZHOLrf821gQfgzGuyqUiw52GGajiv4qQKb113tOoXfYJ01/gvvhkpR
	0Hcjj2vfFQTmfwVn0A0VugiKiMqnjiEaFwygOv4S3EF3lhUpCrCXJBQk2ndXUv4arU1bE4IqjyF
	9ByftxvnYdQmhiRmBMooDwbhbZwgbiF5krh8/sMkig+ieVdU7cPU7dN74ceCTt/nBgD19jLtNc4
	brvoJLqAMZZ5NnW5yyZqSL/OtrmUCUVTXJArjh54wcY6VsWGVaeIdd3ywgYElntY9xbjKmwgVLq
	xNdX3G3nVjhp4qWn8dCV8zF/Xx2r45DdEIg+
X-Received: by 2002:a17:907:72c8:b0:c42:3a77:80e5 with SMTP id a640c23a62f3a-c4d6d79aa5dmr268451766b.29.1794229490710;
        Mon, 09 Nov 2026 05:04:50 -0800 (PST)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a9789a6sm172690266b.66.2026.11.09.05.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:04:50 -0800 (PST)
Date: Mon, 9 Nov 2026 13:16:24 +0000
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH v1 bpf-next 13/18] bpf: Check the return values of
 fmod_ret programs on found targets
Message-ID: <avHHqNh9jAYWZuP6@mail.gmail.com>
References: <20261106210314.1767267-1-a.s.protopopov@gmail.com>
 <20261106210314.1767267-13-a.s.protopopov@gmail.com>
 <sashiko-outbox-202293@kernel.org>
 <avHHMqdiCgT79XWT@mail.gmail.com>
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
In-Reply-To: <avHHMqdiCgT79XWT@mail.gmail.com>

On 26/11/09 01:14PM, Anton Protopopov wrote:
> On 26/11/06 09:17PM, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found no new issues
> > in this patch, but noticed 1 related pre-existing issue it does not
> > introduce:
> > - [Critical] bpf: use-after-free in check_helper_call() [1]
> > --
> > 
> > commit f5e3bd12bcf921a0d31fb8a40c17694ea46d4300
> > Author: Anton Protopopov <a.s.protopopov@gmail.com>
> > 
> > bpf: Check the return values of fmod_ret programs on found targets
> > 
> > This commit parses the "bpf_fmodret_retval:" BTF decl tag on fmod_ret
> > target functions and verifies that attached fmod_ret programs only return
> > 0 or one of the specified error values, while disallowing tail calls and
> > freplace extensions on such programs.
> > 
> > > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > > index 1b58a1796a2e4..71fbb30e4d768 100644
> > > --- a/kernel/bpf/verifier.c
> > > +++ b/kernel/bpf/verifier.c
> > > @@ -13338,6 +13338,14 @@ static int check_helper_call(struct bpf_verifier_env *env, struct bpf_insn *insn
> > >  	}
> > >  
> > >  	if (func_id == BPF_FUNC_tail_call) {
> > > +		/*
> > > +		 * The program which a tail call jumps to returns for this one,
> > > +		 * and a program array does not check the values it may return.
> > > +		 */
> > > +		if (env->prog->aux->fmodret_retvals) {
> > > +			verbose(env, "tail calls are not allowed in fmod_ret programs with restricted return values\n");
> > > +			return -EINVAL;
> > > +		}
> > >  		if (env->cur_state->curframe) {
> > >  			struct bpf_verifier_state *branch;
> > >  
> > 
> > [Severity: Critical]
> > This problem wasn't introduced by this patch, but in check_helper_call(),
> > can passing an RCU-protected or iterator-yielded pointer to a pointer-cast
> > helper such as bpf_skc_to_tcp_sock() drop its lifetime constraints on
> > regs[BPF_REG_0] [1]?
> > 
> > kernel/bpf/verifier.c:check_helper_call() {
> > 	...
> > 	if (is_ptr_cast_function(func_id) &&
> > 	    find_reference_state(env->cur_state, meta.ref_obj.id)) {
> > 		...
> > 		regs[BPF_REG_0].type &= ~PTR_MAYBE_NULL;
> > 		regs[BPF_REG_0].id = meta.ref_obj.id;
> > 	}
> > 	...
> > }
> > 
> > RET_PTR_TO_BTF_ID initializes regs[BPF_REG_0] without propagating MEM_RCU or
> > parent_id from the input argument, and the cast block above only runs when
> > find_reference_state() finds an acquired reference.  Because RCU-protected
> > and iterator-yielded pointers are tracked via MEM_RCU or parent_id rather
> > than a reference state, regs[BPF_REG_0] is left as an unconstrained
> > PTR_TO_BTF_ID.  When the iterator advances or bpf_rcu_read_unlock() is
> > called, the parent pointer is invalidated while the cast pointer remains
> > trusted, allowing a use-after-free.
> 
> Not related to this patchset.
> 
> The bug itself looks real, I think it requires a follow up,
> will try to not forget to send it.

(If it's actually reproducible.)

> > [1] https://sashiko.dev/#/bug/linux-97cfbde4-a454-41bd-bdcf-b13a51d2adaa
> > 
> > -- 
> > Sashiko AI review · https://sashiko.dev/#/patchset/20261106205523.1765622-1-a.s.protopopov@gmail.com?part=13
