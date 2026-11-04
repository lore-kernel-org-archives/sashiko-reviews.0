Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826725;
	b=RELyiRUa58sdfgIFItGI8RjnMuheENu7jKlmG61IrK8OYecj3SfFnuLyqAuJy3kxI7UV
	 S5asYDxm5aJS9GdrM0dfc4qxug2BLfWVd7MmFQXu/KmdvQTG/TyshHaGE8PW9kEQRokXM
	 Sm1i0kNsEzIxpK++qNcFRqy823deFogBjJqlvd69EQnvqwn12+BiJz6hUsAfX3hrkuul3
	 JMUz2XMdL96EZJl3JQPZAzJ3GktHfH6FiclgYG9twqyoRYIQ0gUYjnDCr2YLPU5foJZK0
	 ypf4q1XRWF+xHvb5gEjpChE2s1AM2ENhOMHkTOwi2oui+uXo9pRucpAGJHMBRRW6zwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=d290Y88I8EA7fRNVJZziFi6nFU4gyKqFXCYOMey3i64=;
	b=1WdjYLmb3JH3RlENf0roKF5uxBFoxToQJOmq4WomrPCG/sq6DuOCQ1h2mhD3c/JVzssQ
	 jQEbPIDfT5vey24fEg5Ux4WJ5QfjMMrXaRCYAV4C8ouHq4DHwe141IJh1mD5EB++X7NIB
	 u4O7p3EzvpgG3Tuqk5jS1BNFiRX8GaVoRIuRPuiIWkwnOu4Y35cPvaF18TyqFsxtlkmIn
	 mXpRQXvWBE2h+CpC7NYx4lopwyIMSfjzJzv7xl65e920MJnCSgKtfhJjHJsWIUbWteGpi
	 bzAS34Usfx1OPbCq2VtCU0V00YgHr+bsPvhWbf718w0lOMnc3HJhYgYfb8xa8OQSKPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mhfgwarl;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AB4606A331
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 21:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0AB4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mhfgwarl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48df4f540ebso616386f8f.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 13:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826723; x=1794431523; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d290Y88I8EA7fRNVJZziFi6nFU4gyKqFXCYOMey3i64=;
        b=MhfgwarljnYHkk+ywicj32DoNKEIg33ZFoUfB6hDxYvv6+dvbo+lQ5ZJD/1Yz20Y6U
         HmgaXI+f69alaRQhq2Gj9G6SFRAd2KCXGDp8+3NpPDSZnSW+T1JwsvuXNsYfrgNKlg9j
         xuPGckqzvNLPRtqu8qW4vqwXtZwE2jQYHwwxER5oSh348sqO/nz4OmZfRVnhlI3yGI8G
         jzFxVeeeV4Zddz1l1DHFweHJpZ4j0+rSHv1ALuK5qZWGYQ4y+24ILWNA7epGIAyKP8g3
         U1mN8mbxbEc1UiWWffVrEPblVxIHSVQQlA7+1nmdEp41dJyzu86qVcR8TZtyIVFU/Lz2
         CNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826723; x=1794431523;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d290Y88I8EA7fRNVJZziFi6nFU4gyKqFXCYOMey3i64=;
        b=tBNz0hzvxVaxOUszlceI+KWZVjDA4jtXvZwXTPLu8/+mCvK9vmHEYjdtGraKBrT/ao
         lZ6E/lw59uYVSJEemP+1PCkhPLfzoIV0PD07JvuFjRJvAqPjGsrK0Q9xGb72+GSJj13t
         M9SxRTDOJy7N9ampfWQP7WLtf/l8o+gLyaeIk1vkq01XoWwQJlK2RxyIgIDIdh8VH0ru
         XHzckxKm+H51r1Ft8q/Ki6g6evyw/Qqnd7+UK68HiWhhv81x5q4L+qI2jrnhTIxAKyvv
         eQVTXNBc8lQpQYPAEhJw2s48eHRf0kXNb+m4X+Dss1SNNMB/2J+k6vGoUhukdvVcrCSo
         GZPg==
X-Gm-Message-State: APuU4Z+CRjNnRAuu4JbbIeRakyMcUxoGIhgLJk5WSZy+8qui0C8ug1CV
	KHgShWSST9v8xaeCwn/VZu7hM7KSPHsHm8YMiqGDywZkZ+62vyTRMIlp/pPUCmku
X-Gm-Gg: AYBFou2WhLTKLaV+9G8nF2oKF8VxRWeHfcZ1NvQwgvBEK0olCKgC2wLQz7huq7Z4b3N
	WfpZV0w/HOCzZiXnU1lPua5doCzRg5G2yrmKxBJ02D7nsRTeFoshsMuDk5SoiyUfeB3Ct6gTRT5
	MFYvP/jJbW1hN7VyBShvz0DyA5Sv3jy3MzJfKH+zGOm9W3J6tKj/Gazoh55s9wm2Bw5LBqvGp9S
	sxbk/ZK4OFYBxWAGMH9rU/lj5puVbaaYz02kLpaaTNRNZb7R9iojSB2+yFhoTRj81In/kXfXvQ4
	m39HC1ngpDxUEqzl+wcJYPplZnaiq3/RqbTwG6bNuChIBhAzgDwzt1gzF6bLeo6i7HrcGuWLWHC
	OSxjkteyDWF81m1GzDHrTBTvnTi7iGm7nvZ089FtbNRJqqMzDhSxDAFc93IL/GyYR17qWWfLNmV
	Iot/lIFw2OGTW1FGc0hYa1OvaihLKlU4LNG1zulesenurowprzrp1s9GUCRwZijR7c1GGqUcZyc
	7pcHbxlnvsJrOqIrlHMD216LX9r3obBI+e3I0V1gAFcqwHsqrqh6qEb+dhTlFwzxczqi/1kyXxB
	PhfzLBHzNxM52f4=
X-Received: by 2002:a5d:5f07:0:b0:48c:7caa:12cd with SMTP id ffacd0b85a97d-48e6e4faddbmr37238970f8f.22.1793826723128;
        Wed, 04 Nov 2026 13:12:03 -0800 (PST)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea180e7csm5907191f8f.5.2026.11.04.13.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:12:02 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 4 Nov 2026 22:12:00 +0100
To: sashiko-reviews@lists.linux.dev
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>, bpf@vger.kernel.org,
	linux-mm@kvack.org, Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Federico Di Pierro <nierro92@gmail.com>
Subject: Re: [PATCHv2 bpf-next 4/8] selftests/bpf: Test const kfunc memory
 arguments
Message-ID: <auufoF_H3gau-sYx@krava>
References: <20261103075916.100050-1-jolsa@kernel.org>
 <20261103075916.100050-5-jolsa@kernel.org>
 <sashiko-outbox-194803@kernel.org>
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
In-Reply-To: <sashiko-outbox-194803@kernel.org>

On Tue, Nov 03, 2026 at 08:10:24AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] selftests/bpf: kfunc_call_test_const_mem() fails verifier load with MEM_WRITE
> --
> 
> commit d0fe747011b126dd39ad19108026e34fdd9f18ce
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> selftests/bpf: Test const kfunc memory arguments
> 
> This commit adds BPF selftests and bpf_testmod kfuncs to test passing
> read-only global data, stack data, and const scalar structs to const-qualified
> kfunc memory arguments, as well as rejecting read-only data for writable
> memory arguments.
> 
> > diff --git a/tools/testing/selftests/bpf/progs/kfunc_call_test.c b/tools/testing/selftests/bpf/progs/kfunc_call_test.c
> > index 8e6560c31e781..4f4a6713aa6e5 100644
> > --- a/tools/testing/selftests/bpf/progs/kfunc_call_test.c
> > +++ b/tools/testing/selftests/bpf/progs/kfunc_call_test.c
> > @@ -5,6 +5,9 @@
> >  #include "bpf_misc.h"
> >  #include "../test_kmods/bpf_testmod_kfunc.h"
> >  
> > +static const char kfunc_const_data[] = "read-only source";
> > +static const struct prog_test_pass1 kfunc_const_struct = { .x0 = 1 };
> > +
> >  static struct bpf_spin_lock kfunc_call_lock SEC(".data.A");
> >  
> >  SEC("tc")
> > @@ -208,6 +211,17 @@ int kfunc_call_test_pass(struct __sk_buff *skb)
> >  	return 0;
> >  }
> >  
> > +SEC("tc")
> > +int kfunc_call_test_const_mem(struct __sk_buff *skb)
> > +{
> > +	char stack_data[] = "read-write";
> > +
> > +	bpf_kfunc_call_test_const_mem(kfunc_const_data, sizeof(kfunc_const_data));
> > +	bpf_kfunc_call_test_const_mem(stack_data, sizeof(stack_data));
> > +	bpf_kfunc_call_test_const_struct(&kfunc_const_struct);
> > +	return 0;
> > +}
> 
> [Severity: Medium]
> Does kfunc_call_test_const_mem() pass the verifier without a corresponding
> verifier change to preserve const qualifiers on kfunc memory arguments?
> 
> In kernel/bpf/verifier.c, get_kfunc_arg_type() strips all type modifiers
> including BTF_KIND_CONST from the pointed-to type via
> btf_type_skip_modifiers(), advances ref_id_ptr past them, and unconditionally
> sets MEM_WRITE on sized memory arguments:
> 

the verifier change gets the access flag separately from the original 
BTF parameter in args[arg]

> kernel/bpf/verifier.c:get_kfunc_arg_type() {
> 	...
> 	ref_id_ptr = &t->type;
> 	ref_t = btf_type_skip_modifiers(meta->btf, *ref_id_ptr, &ref_id);
> 	while (*ref_id_ptr != ref_id)
> 		ref_id_ptr = &btf_type_by_id(meta->btf, *ref_id_ptr)->type;
> 	...
> 	} else if (arg + 1 < nargs &&
> 		 (is_kfunc_arg_mem_size(meta->btf, &args[arg + 1]) ||
> 		  is_kfunc_arg_const_mem_size(meta->btf, &args[arg + 1]))) {
> 		...
> 		arg_type = ARG_PTR_TO_MEM | MEM_WRITE;
> 	}
> 	...
> 	if (base_type(arg_type) == ARG_PTR_TO_BTF_ID) {
> 		if (is_kfunc_arg_map(meta->btf, &args[arg]))
> 			proto->arg_btf_id[arg] = reg2btf_ids[CONST_PTR_TO_MAP];
> 		else
> 			proto->arg_btf_id[arg] = ref_id_ptr;
> }
> 
> Similarly, for bpf_kfunc_call_test_const_struct(), when &kfunc_const_struct
> (a PTR_TO_MAP_VALUE in .rodata) is passed, resolve_func_arg_type() converts
> the scalar-struct pointer argument to fixed-size memory with MEM_WRITE set:
> 
> kernel/bpf/verifier.c:resolve_func_arg_type() {
> 	...
> 	if (!btf_type_is_scalar_struct(env, btf, ref_t))
> 		return 0;
> 	...
> 	*arg_type = ARG_PTR_TO_MEM | MEM_FIXED_SIZE | MEM_WRITE |
> 		    (*arg_type & (PTR_MAYBE_NULL | MEM_UNINIT));
> }
> 
> When check_func_arg() validates kfunc_const_data and &kfunc_const_struct,
> func_arg_access_type() returns BPF_READ | BPF_WRITE because MEM_WRITE is set,
> causing check_helper_mem_access() -> check_map_access_type() to reject the
> read-only .rodata map with -EACCES ("write into map forbidden").
> 
> Because kfunc_call_test_const_mem is an autoloaded SEC("tc") program in
> kfunc_call_test.c, wouldn't this cause kfunc_call_test__open_and_load() and
> kfunc_call_test_lskel__open_and_load() in verify_success() to fail and break
> the kfunc_call test suite?

the verifier support is added in previous:
  bpf: Honor const on generic kfunc memory arguments

jirka

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261103075916.100050-5-jolsa@kernel.org?part=1
