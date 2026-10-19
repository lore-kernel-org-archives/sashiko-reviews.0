Received: from mail-oo2-f8.google.com (mail-oo2-f8.google.com [74.125.231.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D54450E5B4
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 14:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419064; cv=none; b=pxLTgV3l8Xph5JiS+/2rByedBClMEHNWZWerJM9KidRwfxXtgCmg4q72SMq5tGrtNf66/4WaIytYN2M/+xm8fVdj/zaB2jShRGUXFjkzrszIG+gleaRGy6nv+O16ar8lRpFFzASw9y9JkLDPmkwbIKD8ky5TH9WAAStJGbLZelo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419064; c=relaxed/simple;
	bh=Bd3lGiWqZIhNaSdNUy6QawoYjcVV49ug1PFzyoHRsr8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=kMb36oESOHrKegvKrfKdbVNLNTZ31CI2PbYO5RafGTg4Zmr7H2ELbB26Tqh2hu8IB2DBfylWbgizvdYOFt5Fn5YOBpz7TpeQQfmPftfdRRx/e0o9iWRpA2pzcdHBD0vwyFHwbbA06Q7Ml47SfvvO6uvBcyeovKCXKh8VfTT7ca8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qN8nnATj; arc=none smtp.client-ip=74.125.231.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qN8nnATj"
Received: by mail-oo2-f8.google.com with SMTP id 46e09a7af769-843c8bbfbc4so989198a34.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 07:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792419060; x=1793023860; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wsWzQzb19VeOVo4gfQPQyMhPBgieYKdiabjyzPIBqNM=;
        b=qN8nnATjwz3txPw5dmzu3j3fJ5QLQoi744X/Z+766e1oyEAKtqrbFOdbiZvbE/cW9t
         qznTlI5k8LX5CnohW6hnNkszqxj/YCjSM3YgPEnb7M5aAKZ1sRPFt+odQ85+7q5+d5tZ
         MGBPkf9ABZlRnd7zFaFd7WNNtTEGro8EaZNYAkuYpZmu9z3wtJ8pThTjMfIS2xEan/Kr
         rXVo3tKC8mRKMZjEPiPpS87Rzy1Xhp5zK+NWwA0PbMTAbAul+pGUNZT9L7hSdA4ZlrhF
         Sr2gBk5wTb1yken9F7kteblPuabBkRUchS395erHKDman//rAterEdPx15IGzNUUeC/3
         kiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419060; x=1793023860;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wsWzQzb19VeOVo4gfQPQyMhPBgieYKdiabjyzPIBqNM=;
        b=WV+ec5T2u6NnI66gvN7zMi/2ZI73A1e9l3RZEkrDnAs+8VDjo6yOrKkLAHVFgahOaU
         OTrwAZI/teGy8ahlU7ia4iA3wcr0Qm90qDgnDwh0JdFkZtlsSIeDOPvixxJ0q6WH+qMn
         D7Ojnh1h7fmq1R1xGvMdXweJwMRoEFl3mNHHGr/mf3Q4F9sNka+JXOB0GAjbWLMChNBU
         vIb6AU7F9pO0P3WwJC95zW7LE1vHLzfp0nReNVIIU8IVeuEK0CDiclbnQ0AskVNU5n7S
         cu1moXVBJTIRq3WEfrAKQo5G5oEFoHCnzs2/2SCPNvJdKEfq90bjRJa5JnQ9uXKlcnwP
         D9JQ==
X-Gm-Message-State: AFq9FYKgO2xUvMVqLyG+Qmhf85vqb+QQyV9Oz5M78X1/wGTYc3w9q7gH
	cPmQZWHel6X0yeHSlhlq3w+/QlHdhLXKKGZCTpuJ1OBslTjIr38bgQewzLtY+tv6Da4=
X-Gm-Gg: AYBFou09LTtDRhfOMRfvdB2LAOHafyAJ5q7sPtJFfeB+Mc186IpVQuA1YkbtoPemtBt
	UV/4JTJEgjio0nX9GoFfxpFzuISSdiD8XI4SkNmlnIsbTyDCORWH82++QmEA1YDa3d6nAvUq+W3
	Gh8AINNjmkerVZQbbJRHpFJe9O5KJUzJDFzmasc+NIEuarIX+3DT3JpmYH/VPYMH9rE62tW5q6g
	oFfo0/gkMDXOJojja1vho2Gqr24c3eSnPQTbienaKSMyHgvESg9HHFvz5IcsHUSFCpkimFcdjl9
	nwfdamHUUYi0WhGKbefcNVH2nPP3UpVqPscYDQscyRWzD1+jWlHvZjESMZUgC19bsGhHB9KA6n6
	AWSIsLUTSlmw0uZLOTKD6NI68z/CIpwkvHZNHOIW6hWmLdWVpyIal3fusz+oCiSI0a9L+IelXSI
	/1SAjgbS5z79c2nAKbyALguw8J+0Iks/i3NfR/kkhl04cEKDaQoELr2RtfPr91t8CPYgVGmA1ME
	8OcUuaXheEpjEkbB8qnlnUkc7mc7p9V46ypG2Ucg7MK75E686b2tLBupaBKVkcPUhnLY5cAO2pJ
	MJjRlbw=
X-Received: by 2002:a05:6830:378f:b0:826:1ccc:8b9e with SMTP id 46e09a7af769-844f92c9c3cmr7951739a34.2.1792419059733;
        Mon, 19 Oct 2026 07:10:59 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:42::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a0f31614sm8808494a34.3.2026.10.19.07.10.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:10:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 16:10:57 +0200
Message-Id: <DM8VIZHIYVI8.20JN6DGIZJ45N@gmail.com>
Subject: Re: [PATCH bpf-next v5 01/16] bpf: Check exclusive maps once the
 program digest is final
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, <bpf@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20261019132203.3034698-1-memxor@gmail.com>
 <20261019132203.3034698-2-memxor@gmail.com>
 <sashiko-outbox-177221@kernel.org>
In-Reply-To: <sashiko-outbox-177221@kernel.org>

On Mon Oct 19, 2026 at 3:48 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] bpf: unauthenticated CO-RE relocations after bpf_prog_verify_sig=
nature()
> --
>
> commit 32dc3dc6de06a5dac6e79c2b94b85778ecf062a2
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> bpf: Check exclusive maps once the program digest is final
>
> This commit defers the exclusive map hash comparison and map claiming unt=
il
> check_and_resolve_insns() has computed the program digest after CO-RE
> relocations. It also removes the early bpf_prog_calc_tag() call for signe=
d
> programs before process_fd_array().
>
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index d138688468236..ca5301fe3f66c 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
>
> [ ... ]
>
>> @@ -23619,11 +23657,6 @@ int bpf_check(struct bpf_prog **prog, union bpf=
_attr *attr, bpfptr_t uattr,
>>  		ret =3D -EINVAL;
>>  		goto err_prep;
>>  	}
>> -	if (env->signature) {
>> -		ret =3D bpf_prog_calc_tag(env->prog);
>> -		if (ret < 0)
>> -			goto err_prep;
>> -	}
>>
>>  	ret =3D process_fd_array(env, attr, uattr);
>>  	if (ret)
>
> [Severity: High]
> Can removing the pre-relocation digest check allow unauthenticated CO-RE
> relocations to mutate a signed program's instructions after
> bpf_prog_verify_signature() and security_bpf_prog_load() have succeeded?
>
> In bpf_check(), bpf_prog_verify_signature() verifies the PKCS#7 signature
> over the pre-relocation env->prog->insnsi and the frozen map value conten=
ts
> before BTF and CO-RE relocations are processed:
>
>     ret =3D process_fd_array(env, attr, uattr);
>     if (ret)
>         goto err_prep;
>
>     if (env->signature) {
>         ret =3D bpf_prog_verify_signature(env, attr, uattr.is_kernel);
>         if (ret)
>             goto err_prep;
>     }
>
>     ret =3D security_bpf_prog_load(env->prog, attr, env->prog->aux->token=
,
>                      uattr.is_kernel);
>     ...
>     /* Prepare BTF and func_info needed to discover all subprograms. */
>     ret =3D bpf_prepare_btf_info(env, attr, uattr);
>     if (ret < 0)
>         goto skip_full_check;
>
>     /* Apply CO-RE before validating the program's instruction layout. */
>     ret =3D bpf_check_core_relo(env, attr, uattr);
>     if (ret < 0)
>         goto skip_full_check;
>
> Although fd_array_get_btf() and __add_used_btf() reject BTF objects from
> fd_array when env->signature is set, bpf_prepare_btf_info() loads
> attr->prog_btf_fd via btf_get_by_fd() without checking env->signature, an=
d
> bpf_check_core_relo() applies caller-supplied attr->core_relos to
> env->prog->insnsi in-place.
>
> Furthermore, in bpf_prog_verify_signature(), the signature only covers
> env->prog->insnsi and the map values, not map->excl_prog_sha:
>
>     if (!map->excl_prog_sha) {
>         verbose(env, "signed program metadata map '%s' must be exclusive\=
n",
>             map->name);
>         err =3D -EPERM;
>         goto out;
>     }
>
> The 32-byte hash stored in map->excl_prog_sha is supplied by userspace at
> BPF_MAP_CREATE time via attr->excl_prog_hash (and a signed program with
> env->used_map_cnt =3D=3D 0 has no exclusive map at all).
>
> Previously, for a signed program with an exclusive map, bpf_prog_calc_tag=
()
> computed env->prog->digest over the signed instructions before
> process_fd_array(), and check_map_prog_compatibility() required
> map->excl_prog_sha to match that pre-relocation digest.
>
> With this change, check_excl_maps() only compares map->excl_prog_sha agai=
nst
> env->prog->digest after bpf_check_core_relo() has already mutated the
> instructions:
>
>     static int check_excl_maps(struct bpf_verifier_env *env)
>     {
>         int i;
>
>         for (i =3D 0; i < env->used_map_cnt; i++) {
>             struct bpf_map *map =3D env->used_maps[i];
>
>             if (map->excl_prog_sha &&
>                 memcmp(map->excl_prog_sha, env->prog->digest, SHA256_DIGE=
ST_SIZE)) {
>                 verbose(env, "program's hash doesn't match map's excl_pro=
g_hash\n");
>                 return -EACCES;
>             }
>         }
>         return 0;
>     }
>
> If a caller takes a validly signed program and metadata, supplies a craft=
ed
> prog_btf_fd and core_relos (such as BPF_CORE_TYPE_ID_LOCAL, where
> bpf_core_calc_relo_insn() sets targ_res->validate =3D false and
> bpf_core_patch_insn() overwrites insn->imm or insn->off without validatin=
g
> the original immediate or offset), and creates the exclusive map with
> excl_prog_hash set to the SHA-256 of the post-relocation instructions,
> wouldn't both bpf_prog_verify_signature() and check_excl_maps() succeed w=
hile
> loading modified instructions with BPF_SIG_VERIFIED?
>
> Should signed programs either reject attr->core_relos_cnt (or prog_btf_fd=
) or
> ensure that env->prog->insnsi cannot be modified after
> bpf_prog_verify_signature()?
>
>  base-commit: 25bb03f0a47b622b9025a1558bf2095ec1f55d26

Will be addressed separately in a follow up.
