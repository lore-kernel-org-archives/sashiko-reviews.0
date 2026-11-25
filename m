Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795582039;
	b=YpjLxp5Y0Wk2gg85gP1I6iXLS1WUZWf291aNukRHHTJJ+wHHKuw0FvnVhZQ6uxV9Q/Gq
	 ZuJorLRxczMAcyDwfV98fLu5hgWb9urjBRWd4kHSnHqC7H/CvHxlZQfPIA1pQBAhy+k6m
	 AAIVFV3Xj1iCrVe8L7V3ZGg692BbFEc16P6jpcgvrM8pY3T7olWYRgpXRbpIJ2VhLtLCa
	 xKnxHLrk5k6HMTY5pr4OwzYhdBnN0FAdyN03Ea+iUHG/L/c/Cli0KSX9+0zYkJa1ItlhL
	 yICT+S24C7L+zM3cG0kQEq8eXsaFLPFeTXIUkcSLN7cyD6GxBImAZDGjTUlvkMYleEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795582039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:Date:
	 Message-Id:Subject:From:To:In-Reply-To:References:
	 Content-Transfer-Encoding:MIME-Version;
	bh=DWvpGGZnFMcBi8vnKFhpJMHt7ncorde3el3j3sr/TdY=;
	b=x1q+gIMu8X2SVdWvZktj2Bgv9QgEqEmkYlR5X+nkSRxL5DLgzwr8tCAL/5zyOgZjgh/d
	 Fye/25HNBmE2e42KZMqS04jglnBHHAqrSs0tuB7s3z6icM0kj/yp8nld/SuE7PZ0HyMp6
	 j/JUwhxV1sHTqGe0evZe4xUGrTB3yHBMI5ROa2AbH+A40f8UQNfzd+YH1/5bU8CxOFztC
	 cmRZUx6LgYuxtAxAeBnxwjWFwr2EB7eXkzE+pqzj29h/q5fEpoguwSlv0s3gxVseeI1wA
	 g5T92xK3OR92y1dkolZScJUg5gEX3IT28Q7c0zuCUabIfZ3+TBVa2YLOGfXD91FZR4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ITL1CZIp;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C5C606A32D
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 04:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00C5C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ITL1CZIp
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f0464dd6b6so31844035ad.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 20:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795582038; x=1796186838; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DWvpGGZnFMcBi8vnKFhpJMHt7ncorde3el3j3sr/TdY=;
        b=ITL1CZIpIimcm67qp4skWhcCX9lDg2v9HHFCz7Qi5FcWlzMeOOcPctvqSUvxvz/eCN
         o8NYfLZpjU0+zo6tekz+OT2EGzO9P6Yg+ZuV+SXABpsHeNkTPmt7j4+xy8QuwsYOVw7i
         mKFKJbioPm1h6bbxLON7dAACLfLNNrOX34Sb1pAltWBVPgbewr5o4Rhp6a+vUaEvIYzD
         bPVobb2XI0NoAi+5GKdXZ8+AEdSzsFs0XYQfxnmUVb+bghi5e/CEZpd+TwPXiG0AbYiR
         ZjbQChCJivWKPT1o1sgrmuGhArZwXUMRw1IWd/7sC/PlHr41ENUCELowQu7ABQRdCiMF
         EBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795582038; x=1796186838;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWvpGGZnFMcBi8vnKFhpJMHt7ncorde3el3j3sr/TdY=;
        b=1b4rhJav5J8TC30vfxbEht7u1YQUAppLusYMoc6BRjZ/W+Nz2sPJWQSM20462mLWZB
         7L7cMrAbdVCDYv5l9Zeu/S1lwYsJyptUzzYFgKzDBTUZ4PX5b6FVDZ0svaihX0F/5Nc/
         K9aSoLGuPxSp0Cfevf1WCRAm1VG/aTt6p2UK8rDRjrRysD60BvBCSj9e+Wqi8mMzNnWE
         e2GgCkkbckxDFEkciXA1x5inxC3dpsFwZ7a078YwnVr/ey4MmGVTvRahZphMdxmFD3Fh
         agJdGH0UjC7Y6FK2fK6RdgVtJ/13b4BftyCWlFNLzurGIDik5ufnIhBCExDUYF+GHyve
         DjRw==
X-Gm-Message-State: APuU4Z/q9y6olxe3DMVL8CVJjZdT/Mg41yAvfd0DfPPyo0YSp+97FAth
	hYVGYciDztwxf7+G+rh1CyHABWHZn/lZMl9XkQHQN85BDOZet7Vpt5UzGXqOR9wa
X-Gm-Gg: AZFdTZcupRPR320/REJQVPBMLUQezA03BeuyBOU+zt87u+DEmm8+jkBzXVzIFP4Pn7O
	1YKi7bJVhze4UR3lz9VuJSAzWNpQeIFhIR1gA1O0ntQwRRIOSyypplW/x7NTypY9KRkIFSLemXL
	AAXdxJYSWx/rlg4WMOL6rCbwUIZDLjx4c7fpvDfJ1U2siUA0uRx27OBk2bAS0gR/bC/+j6DiyM7
	lCY0ZXRkBH7fYcZVmuvGLYUI0g05i6j0Dc7g4dYg7YjW78s4oWnFRbKGXcd5jreXJBaxrXarlTV
	lPhuCR4g2lSG1GpFlY1DfSh6qV0+Vh46CRvQog8caC0Ttrc/dr7/n0V1bFqHYKtSTxg9dT8hbEr
	FvkXPqw+yWz2iMY4oxLqBAXoyk7Z3YAU/1L+B6Yak8HdoUblOIIJi/9dAJqppVSAeCrtHlxg8V0
	uXQWwMafiKoCNGJajE3m7UB8I3EAs550m+v4t6BpjGTJi9PUHZobQwVN2BLoF2E2sEVAvcsPEG7
	3Du72s0y665BhT7RQ5O8WvAeIXmOOT/8HSvr1Tw2NsbBqUpFOWL4mCsm5R0BbOCY7UMPpitCssP
	1zx+YAcDxYn/UgrFKZcZIWi2P1rfzX3AumQuDtNUmlNp8Q4X49JpuI8xQO+0cNIsWH+eL5yTBuz
	N/2OhlfwtJD5aHW66wMO53Tgoc+u5YpjtWw==
X-Received: by 2002:a17:902:e88d:b0:2ef:e864:e0fd with SMTP id d9443c01a7336-2f03ef870f4mr181606655ad.5.1795582038283;
        Tue, 24 Nov 2026 20:47:18 -0800 (PST)
Received: from localhost ([153.61.198.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1215e2sm78920505ad.63.2026.11.24.20.47.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 20:47:17 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 04:47:17 +0000
Message-Id: <DN40PKFY2KUF.13KK78H8OW2J9@gmail.com>
Subject: Re: [PATCH bpf-next v3 2/2] selftests/bpf: Dump unaligned enums and
 a zeroed fs_context
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, <sashiko-bot@kernel.org>, "Hungyu
 Lin" <dennylin0707@gmail.com>, <bpf@vger.kernel.org>
In-Reply-To: <sashiko-outbox-216524@kernel.org>
References: <20261116080151.44860-1-dennylin0707@gmail.com> <20261116080151.44860-3-dennylin0707@gmail.com> <sashiko-outbox-216524@kernel.org>
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

On Mon, Nov 16, 2026 at 12:20 AM sashiko-bot@kernel.org <sashiko-bot@kernel.org> wrote:
>> +		/* 'phase' is an enum bitfield 3 bytes before the end */
>> +		ret = btf_dump__dump_type_data(d, type_id, zero_data, type_sz, &opts);

> Does dumping struct fs_context with emit_zeroes unset read 1 byte past
> zero_data + type_sz when checking the phase enum bitfield?

Yes. It's an existing bug, but let's fix it in this series.
It's not specific to unaligned data. purpose is aligned, and the zero
check reads all 4 bytes for it too:

  *value = is_signed ? (__s64)*(__s32 *)data : *(__u32 *)data;

With need_free == 1 that's 0x10000 on little-endian.
So the dump prints purpose == 0 without emit_zeroes.

pw-bot: cr

Hungyu,
pls fold the fix and respin.

diff --git a/tools/lib/bpf/btf_dump.c b/tools/lib/bpf/btf_dump.c
index bbe8692..e78a14a 100644
--- a/tools/lib/bpf/btf_dump.c
+++ b/tools/lib/bpf/btf_dump.c
@@ -1879,7 +1879,7 @@ static int btf_dump_get_bitfield_value(struct btf_dump *d,
 		return -E2BIG;
 
 	/* Maximum supported bitfield size is 64 bits */
-	if (t->size > 8) {
+	if (t->size > 8 || nr_bytes > 8) {
 		pr_warn("unexpected bitfield size %u\n", t->size);
 		return -EINVAL;
 	}
@@ -1888,13 +1888,13 @@ static int btf_dump_get_bitfield_value(struct btf_dump *d,
 	 * stored in num, then we left/right shift num to eliminate irrelevant bits.
 	 */
 #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
-	for (i = t->size - 1; i >= 0; i--)
+	for (i = nr_bytes - 1; i >= 0; i--)
 		num = num * 256 + bytes[i];
 	nr_copy_bits = bit_sz + bits_offset;
 #elif __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
-	for (i = 0; i < t->size; i++)
+	for (i = 0; i < nr_bytes; i++)
 		num = num * 256 + bytes[i];
-	nr_copy_bits = t->size * 8 - bits_offset;
+	nr_copy_bits = nr_bytes * 8 - bits_offset;
 #else
 # error "Unrecognized __BYTE_ORDER__"
 #endif
@@ -2579,6 +2579,8 @@ static int btf_dump_type_data_check_zero(struct btf_dump *d,
 	}
 	case BTF_KIND_ENUM:
 	case BTF_KIND_ENUM64:
+		if (bit_sz)
+			return btf_dump_bitfield_check_zero(d, t, data, bits_offset, bit_sz);
 		err = btf_dump_get_enum_value(d, t, data, id, &value);
 		if (err)
 			return err;
