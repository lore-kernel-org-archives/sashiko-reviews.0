Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229375;
	b=qq09Xpbj1RlYxA/TiaR/KIQh+InF9yKkzsWWb6XP0zOSOsCFp2SL0WLdY/l6UEgVWjN7
	 wTUS+GUUU2/ZvQnHlGaHYqQ01ZHLfzao3wpqYAV7S2dDF2+NyZyMwizOgMm/WmEbDMxyD
	 II0WDq4+d/OjtY3z+kPzwRwGiR+6D2zLeQIXRci3OhUKFw86Sqo/jPYWYUjnqzfYJVzqn
	 V/Wmp9To0Dte3JP4gWpntjAY8PCUsvEHvf5CiYd6ezGDccIcttPX+6VcP0g4p9vMIzO8K
	 tDkeXv4+FsCmpIXa6dTx63uL51vzIgq9VdJnAF7/YMHFcAScuxjfsq3O4KsfYvH2q/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=B6AQPvXxUiFUnq3vsSRV0XvSHf+1Sj1rCT95ruc8cHE=;
	b=ogiBuISUSbP+ieSBu5zcFgvnnipxgxij1bu/StF0k+1s/jKKUw+lO6sb1yhJWbUSjtNz
	 vw0uznrD8D5Ov0TzJT80VY97W77crdNQe8zXLnvhiS+bD8IvhpUMLqsO2s652b1AJ4urs
	 YQ7o7MP0v34rwMjpkGMzQQGA8X0IOS3NiWiNK1HnR6QULvdY3LfsFby9m01cGnKbQdHam
	 ByKjC56L7bTfueQdkYO71qdiAJ0bkTpLx+unb8JKZ1hyfpNyjklW8/FSokyQf0D2aRygk
	 JXt4h/OlT7cnKbU53qsU6P+tXlvwS3DHDgpNZV94PUf7e1oUsw5fYZHM9WGHne1s6yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=02SZlJh4;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3746606A321
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 13:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3746606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=02SZlJh4
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d581da0aaso82776366b.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 05:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794229373; x=1794834173; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B6AQPvXxUiFUnq3vsSRV0XvSHf+1Sj1rCT95ruc8cHE=;
        b=02SZlJh4lDG/PjCCZg3vg0NOsvURQQjOK29SZAykYJGpbaUFaSLH+fG3Lks+ZO1hEA
         NXKs/Ui0kYhpKG8P4aBV8E6tvMAL8ljowCqTEpJiqe16vubFstPQy0lDHlwMBJ6D8lwd
         NrTmapLZVY4m/1B7lYSXIy8q6pxKjGpmRyrqLS99lGrTG3gNL0tEcwUBJ4mugR5W+Z9A
         35YbK0z3Is8iVTu8we/SBc4n6Yoa2Kg556JXiVAW/cpjPfm3xz//HKQ4/7A2gD/zUUxa
         3SMyvubhPsneedJPTHdX0ZxxR/XdRxjZIteKj/xdwLGtpxVLJLWTLTEisgvP6/kVXY10
         qHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229373; x=1794834173;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B6AQPvXxUiFUnq3vsSRV0XvSHf+1Sj1rCT95ruc8cHE=;
        b=LYtSTyMKyg3WRfeVcNUaBBaotew8kMU8a4nwGby+Por4FNa2zTqHCI/xwM+bEaYQNf
         e6iDJ7wG7eeJQ/gzDYvi1fTULqGD2yA7my1ZPrx2gAcIUmuJBFKKwR0yT2ICztUUXOsM
         GB/WpW69fSC9EREallVWNS+i4cNrNeZQnbohnNf5ZiaPMk/FgZAD7B0Oj0eqIuDbnvUt
         Zi/tRk/yXRvF7fUOkLNjop94M/L5apc0xkFm9Vf53+o+Byc0SNuYLgcwixnfY37FecCB
         7zvUI9OKrxJwc4EuX/y9hg+0d8GnchWGF7KNng4D3wgJ+bfP54reN6PpQFPYp4A3zYIg
         8PVQ==
X-Gm-Message-State: APuU4Z+K0mCubWuKY5UU8ULzmZlftlt5/+aH1ndTc3Vh56k7EDmEAtlr
	/qw61zKrhOQABrK0P5f/AaYEcoKH1FpgiCsgpHoS8phj3GNZkKPvhbk5kocGdQ==
X-Gm-Gg: AYBFou0eJPucIDnJTu+KP9zp0mIvwjiupyYqSDCDxWA7eJ5YXwI6P9r7CEYNl7emm/g
	FrjItqKbXiDXjtOYxGoNmRDWAtKv3kcIlRu7jRa4okljq8wsejDZlSpqDypxqa+E3xUBVKFvDO8
	TpFN/JEMbjPf3RyhbNHnjsqx7hkchfcOekwmQJlEJcUdwEFEFEA9fSgAyqDO4MJNmH8Jcz3rEFz
	Corzeujwr/kVn8DAz1/F8Er9BYMdPjTCowrqm4r6k3NEmMmbDOP202dyB+fDL0Se1SpZxt+DsZM
	FsJXZv6nK7SDffiwLsG9OM/AH4br2KGp7ea78vtdKi5g+68nkHKla9ZZRr1jPbOuJ4bI7vcbLe3
	hXl3oEasFxHv4VW+uTst0NfTJh7p7gdBroLGwj9pJjOB7VIAODgJxoK24WgH79QtF28s8cZKzS8
	FdJnMHG1kXfFzM40FDYQfa3JVup354iBwgqXcWriIDN3o+xsGCOJPmlc+npQEoFUyeg+OCiSGBC
	S25fuDd0bB3jFqJypcvMg37aRrz7STfTS5hXsGTqlICJP1LR4O3LYq7wQcKj3//7mJNBeGAnhQk
	m7XQUQOW+QYKxbGeG8s4sSvmL5+8mKQi2gcu
X-Received: by 2002:a17:907:8690:b0:c4d:5820:325a with SMTP id a640c23a62f3a-c4d6dd768c9mr282571866b.39.1794229373239;
        Mon, 09 Nov 2026 05:02:53 -0800 (PST)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d68d53b77sm168456466b.11.2026.11.09.05.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:02:52 -0800 (PST)
Date: Mon, 9 Nov 2026 13:14:26 +0000
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH v1 bpf-next 13/18] bpf: Check the return values of
 fmod_ret programs on found targets
Message-ID: <avHHMqdiCgT79XWT@mail.gmail.com>
References: <20261106210314.1767267-1-a.s.protopopov@gmail.com>
 <20261106210314.1767267-13-a.s.protopopov@gmail.com>
 <sashiko-outbox-202293@kernel.org>
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
In-Reply-To: <sashiko-outbox-202293@kernel.org>

On 26/11/06 09:17PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [Critical] bpf: use-after-free in check_helper_call() [1]
> --
> 
> commit f5e3bd12bcf921a0d31fb8a40c17694ea46d4300
> Author: Anton Protopopov <a.s.protopopov@gmail.com>
> 
> bpf: Check the return values of fmod_ret programs on found targets
> 
> This commit parses the "bpf_fmodret_retval:" BTF decl tag on fmod_ret
> target functions and verifies that attached fmod_ret programs only return
> 0 or one of the specified error values, while disallowing tail calls and
> freplace extensions on such programs.
> 
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 1b58a1796a2e4..71fbb30e4d768 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -13338,6 +13338,14 @@ static int check_helper_call(struct bpf_verifier_env *env, struct bpf_insn *insn
> >  	}
> >  
> >  	if (func_id == BPF_FUNC_tail_call) {
> > +		/*
> > +		 * The program which a tail call jumps to returns for this one,
> > +		 * and a program array does not check the values it may return.
> > +		 */
> > +		if (env->prog->aux->fmodret_retvals) {
> > +			verbose(env, "tail calls are not allowed in fmod_ret programs with restricted return values\n");
> > +			return -EINVAL;
> > +		}
> >  		if (env->cur_state->curframe) {
> >  			struct bpf_verifier_state *branch;
> >  
> 
> [Severity: Critical]
> This problem wasn't introduced by this patch, but in check_helper_call(),
> can passing an RCU-protected or iterator-yielded pointer to a pointer-cast
> helper such as bpf_skc_to_tcp_sock() drop its lifetime constraints on
> regs[BPF_REG_0] [1]?
> 
> kernel/bpf/verifier.c:check_helper_call() {
> 	...
> 	if (is_ptr_cast_function(func_id) &&
> 	    find_reference_state(env->cur_state, meta.ref_obj.id)) {
> 		...
> 		regs[BPF_REG_0].type &= ~PTR_MAYBE_NULL;
> 		regs[BPF_REG_0].id = meta.ref_obj.id;
> 	}
> 	...
> }
> 
> RET_PTR_TO_BTF_ID initializes regs[BPF_REG_0] without propagating MEM_RCU or
> parent_id from the input argument, and the cast block above only runs when
> find_reference_state() finds an acquired reference.  Because RCU-protected
> and iterator-yielded pointers are tracked via MEM_RCU or parent_id rather
> than a reference state, regs[BPF_REG_0] is left as an unconstrained
> PTR_TO_BTF_ID.  When the iterator advances or bpf_rcu_read_unlock() is
> called, the parent pointer is invalidated while the cast pointer remains
> trusted, allowing a use-after-free.

Not related to this patchset.

The bug itself looks real, I think it requires a follow up,
will try to not forget to send it.

> [1] https://sashiko.dev/#/bug/linux-97cfbde4-a454-41bd-bdcf-b13a51d2adaa
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261106205523.1765622-1-a.s.protopopov@gmail.com?part=13
