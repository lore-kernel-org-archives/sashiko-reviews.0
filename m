Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703819;
	b=0YOcmFAnqXb+B7pHdcAXdZpRJkyxl6AM9LUvu/ywMMoO+YqOQrqLbQ7dXvCh5uUoTitq
	 Hs6toIR1mLXaWESDyh/E//b2wk1Es/Jm6SmjXGeE6bwCoIsgDweE1p5wSbWcG/t+XXlEp
	 ILo3JHuaf4gjDlrINDVG3/QdtOzgni5SQ1CeC/Lb5OMOAaec52Sot8s0BzbBjP+SZRJ5q
	 N8iHdWGhRN1VmnakKkht3fw4aJnWqnyjT49u9LYlaG583+iHJ7JloxfgJdmNDinc2stMs
	 SLCYqOa5clGmppz7sfGG7JTPWCe12+F311lTLjB8WdFDyFVxw10t5ploOKztpeVPGXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=SyMjPxEHghkwGhRTZpVd7OX72NBhKtbfP1nFSzvk1f4=;
	b=HS44taj6aua247po4ayVyHsZ6ksUk5tlKY8/ZO03XIKCUnrMg7u4ooBUtqTz6OHMQ5mv
	 q8R0Uun6fr8So4D3oPhQDbmmnLQAlPz3oogg0VtHG4OeKDky8t6UAuWxA3Q05eMALmDVH
	 RVvYiT11VLU8wkg0yuVGdh/pHjejpJOn4TRBgXTOrVTgs/RgLRuf2Y8RYraKOyCoLQqvX
	 xJ/jToyBt2OtxJKX9T+3tFBLYzakYpGToxUkGc4WcMPnbEC4H+vVvjCpYTXgODmIvWemp
	 k7DLSFeQ5XrhTVtQ3Nnc4+d7NR/wObisahx8N6crMOw8qoxS3c5xE1HJehiKKETpbeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EsYrGBQE;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0DF606A32A
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 14:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B0DF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EsYrGBQE
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so66699995e9.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 06:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795703818; x=1796308618; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SyMjPxEHghkwGhRTZpVd7OX72NBhKtbfP1nFSzvk1f4=;
        b=EsYrGBQEFfJhWMcjiXem6CbTfXVmjBoeW5wW0MRRUJ3UDrXLZdzo/VG1BGi8Fucwzf
         X4juz213JEqpV9eywN63f0XPK86K3hrTseiV9W4OBJ1esJ0shJRgBTtPMVUMeoPxFeKM
         VgUZYZAg22eUx0yARXV26Ifsc30iLoysOB9WM8z/D8OBa+eOc6h6tkId78tO9lpFSif8
         AJZM8pRwu+jJMxlU4hNBN9q9CWJJYSNBk+e/1tx0qvHB3QMvHjDpeGuIRXuHg+4hRzc0
         DSmfkm/kRbsZG8BiywSbmHkOGeeHWFc8g51XNzQpPGBq/BJtdh8VxxDAA27bhdQ+Tfw6
         OxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703818; x=1796308618;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SyMjPxEHghkwGhRTZpVd7OX72NBhKtbfP1nFSzvk1f4=;
        b=yp7AmnIILg+bLXb0XAa3s50eWFaMCrJVxFFE5T6cJWBnhyeVcLXHKk6Z6PmFicFAsX
         DrWAO1tL8re4i1Qii5aJ8FMqn7m7ESR36R7XP6ZeUk2Xy5zwZsKnso/HssEstuShF6+0
         TH4nZBObTtApDsl7WADCGOhObKHGMScdjTSi63964s9r25cAzV/XZcCSY6Fx1qdLndij
         NsgSt/w4GtqDSYotn9yQj3TTAQuvH65NUGpRMNQuUzGRgfzVQPAtsiJmjFNEkpAew628
         k+Rz+DdwHMwHwtLYFkoE6XKgCMVBqXsYdrTMzpJSFi8ik9vuYYrubxy/7G7Bb+Si57hY
         02mQ==
X-Gm-Message-State: APuU4Z/WfKhjQNFIu71cL4dzZqMnaNg0n6+frp6I0MHPOk+uMSVSTm94
	fHgFEcalUlvcBf0sOYblWfh3Q9qj09j9aXl/2i7Gu7dx0zDlBQV7IdArl3wWXA==
X-Gm-Gg: AZFdTZc7+yQEySnCxVcMdgCyquhOIuG0eZa0mxmQe7PMGhg4t+zq0ny/0GFDdW5dfv4
	EuaD6YCLfQI2rcyt7gXXrdSJodZZCW8gA/idlvS/zzRHEnAJFC5jGpQgNq6R9mkfQ8DLdmEnHvg
	sFYInfgmIeJVqUcLyFkjEGo4uCxBo0bs2YyUBtu87dkzLVB3zAgXrllv3Lh6xbzen0ERlyqULu1
	iE8GsFrh0Hkf7Ogd9m9L4pjfraIYmQkqnL/cqFL8o4ZXMDJVMeGeHU+SMVavXeAtJDlP8rDDsPb
	YCrR8dz0yaHxP2kcMaESI04Dp1qcqzbt0Qiu2rxNn7udwR6AoDgRcfUbKyzlZdT8KIxzBWmLcuH
	DXoCdH6LbDNCEfHvphQUfPoQ4456n6Ej8vFT7j1RJ3Al4c7K5ARQhmjRu5c9Oxo4mvGJrxU/Rwu
	1KIv4R4iuyPEODOmSFW8XYFUDTDKe41a04ibwNe/g5NpyqiAzhHp9icZfTjr1Kg9nkY9SpgmkXI
	/SXvA3Krcc3lmFr1qOIa5UgaiaECZZ15jwC67jR3zRQiS/rtufedlA+53o+W+xA/oWhh6pdXhP6
	9GK2beWDPvuoRr0/4vFTZx96hHL+L5JceSEujQ==
X-Received: by 2002:a05:600c:4e87:b0:4a7:6bc7:f778 with SMTP id 5b1f17b1804b1-4bb88938d38mr445041075e9.30.1795703817870;
        Thu, 26 Nov 2026 06:36:57 -0800 (PST)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm560823795e9.12.2026.11.26.06.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:36:57 -0800 (PST)
Date: Thu, 26 Nov 2026 14:48:34 +0000
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH v2 bpf-next 7/7] selftests/bpf: Test functions which must
 have no fmod_ret tag
Message-ID: <awhGwnquBmvvliHf@mail.gmail.com>
References: <20261126142915.1106330-1-a.s.protopopov@gmail.com>
 <20261126142915.1106330-8-a.s.protopopov@gmail.com>
 <sashiko-outbox-235702@kernel.org>
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
In-Reply-To: <sashiko-outbox-235702@kernel.org>

On 26/11/26 02:27PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] selftests/bpf: fmodret_untagged.c duplicates fmodret_retval.c
>   BTF tag test
> --
> 
> commit 6b9f59cbaa78b14e32ed408a9747440fae862df8
> Author: Anton Protopopov <a.s.protopopov@gmail.com>
> 
> selftests/bpf: Test functions which must have no fmod_ret tag
> 
> This commit adds a BPF selftest that loads vmlinux BTF and verifies that
> specific kernel functions are not tagged with bpf_fmodret_retval:.
> 
> > diff --git a/tools/testing/selftests/bpf/prog_tests/fmodret_untagged.c b/tools/testing/selftests/bpf/prog_tests/fmodret_untagged.c
> > new file mode 100644
> > index 0000000000000..9f4b0586fe8f0
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/prog_tests/fmodret_untagged.c
> > @@ -0,0 +1,58 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/* Functions which return errors, but which the build must not tag as fmod_ret targets */
> > +#include <test_progs.h>
> > +#include <bpf/btf.h>
> > +
> > +#define TAG "bpf_fmodret_retval:"
> 
> [ ... ]
> 
> > +/* Has the build tagged the function FUNC_ID, or any function if FUNC_ID is 0? */
> > +static bool tagged(const struct btf *btf, int func_id)
> > +{
> > +	int id;
> > +
> > +	for (id = 1; id < btf__type_cnt(btf); id++) {
> > +		const struct btf_type *t = btf__type_by_id(btf, id);
> > +		const char *name = btf__name_by_offset(btf, t->name_off);
> > +
> > +		if (btf_is_decl_tag(t) && (!func_id || t->type == func_id) &&
> > +		    !strncmp(name, TAG, strlen(TAG)))
> > +			return true;
> > +	}
> > +	return false;
> > +}
> > +
> > +void test_fmodret_untagged(void)
> > +{
> > +	struct btf *btf;
> > +	int i, id;
> > +
> > +	btf = btf__load_vmlinux_btf();
> > +	if (!ASSERT_OK_PTR(btf, "btf__load_vmlinux_btf"))
> > +		return;
> > +	if (!tagged(btf, 0)) {
> > +		printf("%s:SKIP:no CONFIG_BPF_FMODRET_SCAN\n", __func__);
> > +		test__skip();
> > +		goto out;
> > +	}
> > +	for (i = 0; i < ARRAY_SIZE(funcs); i++) {
> > +		id = btf__find_by_name_kind(btf, funcs[i], BTF_KIND_FUNC);
> > +		if (ASSERT_GT(id, 0, funcs[i]))
> > +			ASSERT_FALSE(tagged(btf, id), funcs[i]);
> > +	}
> > +out:
> > +	btf__free(btf);
> > +}
> 
> [Severity: Low]
> This isn't a bug, but could these untagged vmlinux function checks be folded
> into tools/testing/selftests/bpf/prog_tests/fmodret_retval.c instead of adding
> a separate standalone test file?
> 
> test_fmodret_retval() in that file already loads vmlinux_btf, checks for
> CONFIG_BPF_FMODRET_SCAN, and scans BTF_KIND_DECL_TAG entries for
> bpf_fmodret_retval: via tagged_errors().  Adjusting tagged_errors() to start at
> id = btf__base_btf(btf) ? btf__type_cnt(btf__base_btf(btf)) : 1 would let
> test_fmodret_retval() check these vmlinux functions directly without
> duplicating the BTF load, tag lookup, and skip handling.

Will do if v3 will be needed.

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261126142915.1106330-1-a.s.protopopov@gmail.com?part=7
