Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2216E345731
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 22:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781218513; cv=fail; b=YsEw5pSzkGXSJ4UWPKCqiSmafNvrN13vmS5APWCa8QebjcTu2RzkyQx5IhHx6WCahaQjSDA7vfvKYz9Ibc6l4yU1K3WjCJra0KHAy2Zj9chSAmNGZWapP7P03YWRW1CJtylCmUGlFBkdf7v+G6BsXMFWeHAkXsaAUNJYMRPekKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781218513; c=relaxed/simple;
	bh=TIHi+z0G+5507IUn8zV5xzVcf+lqGAUQi74HLRRwRWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eCUL3+xIYuqS4e+LPwmnZz7S7TZiakDRrRuzLsVo9tDLUpYOUaB11vUxSyt41waFT4eeg2dKDSwnq/ynL6TaFZWCQKPcILE6WiAvqA1D3UvHHZ2GR5TZW4+eu8Q8ri1Ijdj/+OXA6bFIC7Bz4eM08jJn1R1IVY3+2Jxb3T200LQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=GSoH5Slu; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="GSoH5Slu"
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BEJoD12261625
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 15:55:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=PstN10mGGH+L0A0CuZvfxdqRssEKVpUiOodgdSJiiVo=; b=GSoH5SluoitA
	ZhbhWOwNzZW0wVQslaRzOinRNj0iQBrT8vlZdPN2pSQ81NJhJsM6lrkRBfl65wwB
	Y6XI9NxpND7U3QFlGs/3h9zNcYs5uhOwY47aIU5+EFwN8tL0uJjB3xT4Nc2flLB8
	OuoRY9cJNAxqPnad+ocTYUbkKCVC8IBCfC3SpUi1FJ+WZQob1ge1Jpp9UqjUFdWz
	K1c+zwzcafG7syWDN66Fj9WqXwz7FP2S9x2PYeJbkQE2VqOZpCCSJ1Pi0LPZggjM
	b2aFPVkM2zchaidEebRvMGWAVwnPUS0gkiIJhE8DgZHNoygYJJTbBZkcw54dlUux
	W3AMfKkv+w==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4eqe7b994e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 15:55:06 -0700 (PDT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e6f905ea78so792026a34.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 15:55:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781218505; cv=none;
        d=google.com; s=arc-20240605;
        b=gzc+cM9bRaw9GqBh8lNKeyVdfGehoRAFZmpBXjxgAvy9vbv1228vjzvzAEqflP1//Y
         9p6JORkgE5lowjVGIFZa9T7an3I/LlFGLufbGo/aFu26emzsgg5386vd5MMB/dmLT/7w
         6OHj97UYmzQwEdv7cP69P3XgcS8/pQ4b9JRvAXG4AXs+m06doXTwqwv+g2IFIV1xe8nl
         ZXkYVOPPkI+7DDD38gA1T21NHMuGsTwJHqQKMbyN1CgBRxF0quT0khGrWuYFPHoJprJR
         KrTVW7CAUdG9rPB1oVIcLBmUnch0PlRtddeQQi8kCRMvoMcPqOzUYmp60JRG4tPyCoLC
         TDXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=YYy1fCwoPtiMDCF76edFD+6WvAo/7l1hbbUr+kdv9e0=;
        fh=Y+KYivgtax/z85gVt76uyK1ORwE9fQMGlYAlHdz9B0Y=;
        b=DDAa0FwdaSc8T4jlukboPKcpFnpYzKGETCjvK1HDyf9ziule3h6qtCfVYbQCnv6IMN
         u0aX+OCgdenUBlZszEguw6v1Gan4JsAL5po9iGg1WQEDx9j+mh/niyLocFeDKdcI1eGQ
         BcsrFNRbJmBwaQeO8w4TydhyPzQ1/kaqTUHnXI9ilPUi8L+PE5ycy8l9Lo6MihGhdt2G
         LJoaZdcFq9Wj/y3ESO/S83i386wW0w/PzxefSZTEQ5gyfiDQUNO8tFYY8I3v9e6j4vIa
         PIOww6Ku1qnCqcNAXcGDQXUYUyNJrguzn77Bu6IrkCPsFeeydlQXl5gulSVL96IPJ6E/
         ItrA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781218505; x=1781823305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YYy1fCwoPtiMDCF76edFD+6WvAo/7l1hbbUr+kdv9e0=;
        b=pq35ZuAfLInSCi9MsFgQaKfBa5pOd6b0ybc3sHwskMvIjmz1nEsFxo2MSYemFIpSS/
         c5KRNxvI4XL6DSiwgAezxTjNF6JmS49pMtul37h5Tr2BdkK0VlPqkbw2tcbXfGz3816X
         Ij5FvHFsnLlzKSPV5nWncjQz5snxJfUElvvtN4nWX5npLMpp6lWNanSuJeWZ22V+XVKd
         QoNxDFnrCBac1Qui34Uzp+pNU1lHe9eBOIhdpJIiweFwvUTL9E+Ng45A6WKvVh6Orp+6
         7DRBIaSher1/z5RReiBb3//5/484IvPk9RLgY1bl2yUlol8NWnHnnq9rrVEJV61a2jRS
         4veA==
X-Gm-Message-State: AOJu0YxHrgicdvsZlFC6FUYGef/zZmULNf/G+L2voEugUBJcu+cJOgoB
	5Z0YZTFBttYM5UWWVXO3gGXRFlN08knGPgDU1+/0x5xzuL7VMISHE7m0Yn2IwLr5aeF0cUkrQhr
	DdruvHoFiqNZ1bBPDDR28yojF8PG/HgLhNEK7r3Vn5lqHfhI4w348DN7unaujbXtANrG/REZb3N
	yWKR/N2FQi6eoEeZz7TPk3YTH7h4uWDoPB5zzfOkqsmEXWEMSXGLM=
X-Gm-Gg: Acq92OF0cByZbuejkoBDlQ6AQtLwTidRRFThaHFGU9UGNX1audwEIXOEwiIs2fk2ahQ
	GPeQTa59Oj8DcbqIkOPuWGzob4kC1bm0X83njhVWkySlaYMaQcl+m3sqJbvR5w6O17R0DWdG1uc
	CZd6rOQSfPD2sgqvf+79HLkUXedgYQwERVA0SRTLyAJwVnrnJCqyHdtBrum3uxA8d0K25MG4DCc
	lGhrnZ/0nIJ1IHJW64nag==
X-Received: by 2002:a05:6830:3e01:b0:7e6:f9e4:539b with SMTP id 46e09a7af769-7e7846e89d4mr84837a34.9.1781218505370;
        Thu, 11 Jun 2026 15:55:05 -0700 (PDT)
X-Received: by 2002:a05:6830:3e01:b0:7e6:f9e4:539b with SMTP id
 46e09a7af769-7e7846e89d4mr84824a34.9.1781218504891; Thu, 11 Jun 2026 15:55:04
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260610193158.2614209-2-zhipingz@meta.com> <20260611202559.80EF21F000E9@smtp.kernel.org>
In-Reply-To: <20260611202559.80EF21F000E9@smtp.kernel.org>
From: Zhiping Zhang <zhipingz@meta.com>
Date: Thu, 11 Jun 2026 15:54:54 -0700
X-Gm-Features: AVVi8Cec0xPin_3Tu2bkuOl2uwNE0xNjryiPQU2XmmSIcyBQ5hzh3oLNXw3MBdo
Message-ID: <CAH3zFs1U92oXZse+8h5rKNrfWmtqt3SeCRJa8D9O8R02chnwTA@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] net/mlx5: free mlx5_st_idx_data on final dealloc
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, linux-pci@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIzMCBTYWx0ZWRfXweovgkX7NmzF
 775AsKVfFMhgujbEdo+7u/ZVvaA12TqfHs5HFs7SPy4eJY5xQ6OEqjM+QBAoL24FkEs8ToB2pm5
 oP8eaZtjw3sRVn3R6BjvNxHswTuBz0U=
X-Proofpoint-GUID: t6LW5s_yng3vbyTDPp7QZrY1urdiJR59
X-Proofpoint-ORIG-GUID: t6LW5s_yng3vbyTDPp7QZrY1urdiJR59
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIzMCBTYWx0ZWRfX+6Nxn4Xb95w6
 1h3OQ0g8Qi9qAmNEcBotGx2f+vkGK1T56NRp4nZniyiqpTi+BsxDYdZyugldGCouPm42P1L52y6
 WXhx0RxW3ABU26WYcc6Vt7INqoTFfzRruVnWwkvtJ6sqavdJGo/28xmGNUZfrCcv7bGBPJozBQv
 /yK2LfPo7EyvnUSOdQFL5l4HLYDRf2x1IVo3iD8DULWPuww8TlUo5gXKZ0foJ7IVUS4ofEpqDlG
 nrYVY0JN5So6Oh1kJBJA1reGrHdCD8dd4ASn9k0jh5TsR/BJvrLybmZLkxr1cXGOsz+fRUWD0Jj
 Q1j5TlMpQSpWaXdiF4o+XzLG8ss0DPVAjVOV4HGOjH1MRucODkbdNx9jvbnezNW1xJt+qzfrUPh
 I2bnTKjvQ3Ke4Vf0y83+dD27bI5oqLHjXI1ifh0zQB7piiXrobi3MY5ZWOmG8LKZw6LNKFvxeQ6
 UQXUbOs8uL5iAlaTy5A==
X-Authority-Analysis: v=2.4 cv=C8nZDwP+ c=1 sm=1 tr=0 ts=6a2b3cca cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=xtH7KyWI9dI7BmFOsl-x:22
 a=c92rfblmAAAA:8 a=VabnemYjAAAA:8 a=VwQbUJbxAAAA:8 a=37eGqx-N3tBcJSbcPa0A:9
 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01

On Thu, Jun 11, 2026 at 1:26=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> >
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [Critical] Out-of-bounds read in UVERBS_METHOD_DMAH_ALLOC handler due t=
o missing bounds check on user-supplied cpu_id.
> --
>
> commit efb72743b37fe4c5005fca2d75b36ef50832bc6c
> Author: Zhiping Zhang <zhipingz@meta.com>
>
> net/mlx5: free mlx5_st_idx_data on final dealloc
>
> When the last reference to an ST table entry is dropped,
> mlx5_st_dealloc_index() removed the entry from idx_xa but leaked the
> backing mlx5_st_idx_data allocation. Repeated alloc/dealloc cycles
> therefore accumulate one struct mlx5_st_idx_data per cycle.
>
> Free idx_data after the xa_erase() so the lifetime of the bookkeeping
> struct matches the lifetime of the ST entry it tracks.
>
> Fixes: 888a7776f4fb ("net/mlx5: Add support for device steering tag")
> Signed-off-by: Zhiping Zhang <zhipingz@meta.com>
>
> > diff --git a/drivers/net/ethernet/mellanox/mlx5/core/lib/st.c b/drivers=
/net/ethernet/mellanox/mlx5/core/lib/st.c
> > index 997be91f0a135..7cedc348790db 100644
> > --- a/drivers/net/ethernet/mellanox/mlx5/core/lib/st.c
> > +++ b/drivers/net/ethernet/mellanox/mlx5/core/lib/st.c
> > @@ -175,6 +175,7 @@ int mlx5_st_dealloc_index(struct mlx5_core_dev *dev=
, u16 st_index)
> >
> >       if (refcount_dec_and_test(&idx_data->usecount)) {
> >               xa_erase(&st->idx_xa, st_index);
> > +             kfree(idx_data);
> >               /* We leave PCI config space as was before, no mkey will =
refer to it */
> >       }
> >
>
> [Severity: Critical]
> This is a pre-existing issue, but does
> UVERBS_HANDLER(UVERBS_METHOD_DMAH_ALLOC) in
> drivers/infiniband/core/uverbs_std_types_dmah.c lack bounds checking on t=
he
> untrusted user-supplied dmah->cpu_id?
>
> drivers/infiniband/core/uverbs_std_types_dmah.c:UVERBS_HANDLER(UVERBS_MET=
HOD_DMAH_ALLOC)() {
>     ...
>                 ret =3D uverbs_copy_from(&dmah->cpu_id, attrs,
>                                        UVERBS_ATTR_ALLOC_DMAH_CPU_ID);
>                 if (ret)
>                         goto err;
>
>                 if (!cpumask_test_cpu(dmah->cpu_id, current->cpus_ptr)) {
>                         ret =3D -EPERM;
>                         goto err;
>                 }
>     ...
> }
>
> The dmah->cpu_id is copied directly from an untrusted uverbs attribute
> without value validation.
>
> Since cpumask_check only emits a warning if the CPU ID is out of bounds a=
nd
> does not cap the value, could test_bit compute a bit offset far outside t=
he
> bounds of current->cpus_ptr?
>
> Can an attacker exploit this to read unmapped kernel memory (causing a ke=
rnel
> panic) or infer the contents of kernel memory by observing whether the
> syscall succeeds or fails with -EPERM?
>
> --
> Sashiko AI review =C2=B7 https://urldefense.com/v3/__https://sashiko.dev/=
*/patchset/20260610193158.2614209-1-zhipingz@meta.com?part=3D1__;Iw!!Bt8RZU=
m9aw!-yx89CgOVvF9E6-bX3TWkgI1oBHKqqBP1C88LmgmavxlZKHEFJdEeW7gwHdiVC2U2gzS3R=
GnvW_CiJNQVwxS$

Not relevant to my patch series.

Zhiping
