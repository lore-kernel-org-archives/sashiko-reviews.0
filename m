Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F9B246788
	for <sashiko-reviews@lists.linux.dev>; Sun, 31 May 2026 01:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780191486; cv=pass; b=Zk8towtYVUKWOutkFb75b4ph3xu48ZZKG4/btJ8VP9gP/b8S1bIa7RBFKZqgH3OiboaVg1hrATZ2Wa4nZ4OrYZyT7HdvSV97Y4k8Bifi/gMnshPflY8aQwDMG/OZYwzLglmp5OVkj1nOQ2mSis1o2j1HhHQrYwO5bLJ4IOXUIBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780191486; c=relaxed/simple;
	bh=y3gLTJcDJCDzE/sfnkF6XTrsBFtj5BVc/GJwrhbKPok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=egSmI25UuqMANYIA45lwr1QOYKBCMNazcvmntItcnGEA32l264YhobqESQ+ahVLyB5xUzReqwV/sKV441QaHOfxfLQ6uo5YKYjEnOVPDq7UHToKPFioVFwp6r6ntx8fUdDJ1hL5MRpJD1RceEXfElxa2QP36niVnHh1A18UYVbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sMZEWOIy; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sMZEWOIy"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-516d78ba1adso611cf.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 30 May 2026 18:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780191483; cv=none;
        d=google.com; s=arc-20240605;
        b=JQWJjP4zUH4DjNUnVKOQUaDaP+N04xmf/mkqMKFh5eLwU4LOvBpop4j8ISbKHEfMP+
         Zrjn3DZMaCWI3zGPKu72JcaBzI98Jw1LahyBXh5zfqEWtiERZ/VnjtrCKm4vTiPQEAJa
         jAz/XkhDfOZbba2aUeGg0f83YsWmbaaAiYOdx+kZsExNj/DMNoIzgHFXyejdaqil3mI0
         TGwbhOdRpMqbmJDqeLWDU0076h8wrwp2P56e1q9hQkLcUDWGSlrNSaUFbxWu6UsyYWDD
         oegPKP8+eVRvugNYTMK7fYXJOfhrTk/PUtzHL6fftBFCdRWN2x0GXVSHbvTNghpmDIBn
         rFCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7KEWFe5PI5fZtcQJyeW/bUVH7eGb4JFji1z5+4lcemo=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=CnM9F+FjYF+VHWZHRgY8bKQh+QnMJx/IYsopeb/eRhVtHJ8hRRETqZUQqBxgs2H1Ac
         WAHSxjXq94DuM9uZAoHXVZ+NU1M4nPfUEA5rFPSGDf6nKviNLX7tbHax2ktNv/QMZcHD
         BO+0ttBMQS9rZDaCMZ0Qhp8v4TPTVAY1Dc+RO0kPCn3e5YBV/7rgx03gKk9WPBOLEMT4
         gfDRWtr+vCfSo8rbL356WV1/3ACygTBKtAss8MXFzJb2IdWs0+7DFsRRUZRzXijAUnYm
         USophZ9RO9fJ/YCNu7jgMqriadRv0timREi7sou0ASRbOa5+1lg1cPkdwkQ8arD34D0c
         +oFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780191483; x=1780796283; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KEWFe5PI5fZtcQJyeW/bUVH7eGb4JFji1z5+4lcemo=;
        b=sMZEWOIy13jOmuAMCUqFpJZJj9QHpzu+BsmPZvipvUS6jhuhJBJ3K9/fzIXzDYJMfM
         wCCJ6DDk8+ECN1M81zYrLenskxK7gj92NV4VLzwQLUp/FT7l4zCKIkt6mMhphRcRZ5wX
         gq8szoz1XYPV5zqLQSW8NA9c+4tLTm/UJWhm3eZL4+pk5GMmXmtE+SGCV5KMdsd1Ygso
         wrH45ZOJ9Dor+/kSF60S9wdOryHv1GykdBQEUzXWOeLt45Rcxvu/i5zy8E8Qgd3UNpJy
         MibKuenuOFrbZvqzUpAqa9m61gfmVB9z/n0bc+5MQC4w2nSEHvwpUr/t9SFOyTKTXI5I
         pgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780191483; x=1780796283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7KEWFe5PI5fZtcQJyeW/bUVH7eGb4JFji1z5+4lcemo=;
        b=GhON7PmJ9c2RxmNrHIDJJkpkbktc/u5clPEnHWSjaxvSDD+wXiOdMd6xt5dlZpNeoy
         QXTRJr7IjVn7psWoWiKSuKUQxCFE7BuycvRcQ2gCsJno6+Vq3r110CVaJyWyqBGPQszn
         kqkZtErHeonpo9jI3VhXGRGxf1ulLCrQHJmTzyuEI8yzFTuIffRKpePUK55ttNTPZKnF
         EUW719HaBs9spignj0MHNdeRgPbfIwb/SeggfhYkKyQWVt6Oxh+339dVZ74WQQcZeuxv
         RdLnEkpuPUMMDCEnLVuHuHROkL8iGowCI+L6fVdhKccBT4RoxNWcLezaZWFBRK2uy+KJ
         4ZfA==
X-Gm-Message-State: AOJu0Yxp921w5pnAk6OnDfk9Y3Zljw25+ijoCcdWucjYsdfQC9N6fasY
	jjVmCGV/VKIgTZ+OIFvbIW2xckV8A404ru5uwPbHqu9QWqsFfdPLSnBEarN2KAg1od0AXZX9QQ8
	wyY3PUJYAYe2sXi22Qn0WhZABh4TV/qo1nRFftT3T03jAUWrhbYoc7DMXzB9s8Q==
X-Gm-Gg: Acq92OEmbVaXdgH0aBw3ZvgeGW+1V5gk/y02K2YTpH0F2esKmBJjrTJyjbHLxQWT226
	05I2T7omfSrqOum/ZX/b3rHdnBOLgPbuE/XMu83rUg57ftL92BxzHJ7XLT84ANKdTQLDFKosx7Z
	xz+sIQZ0L9jLHwj0XCf/jyKxa12CwDMfGz4dcwJ9yxJ9PHqmiXtE6sxG0NJPHPRaYCkWnXdsIyO
	4QV3Ur4JRZhyyEaiTNsKUAJOtE9T6+e0Z1qV2t4SZPQyEb5mMz6xlnfyoGaWRRbKuSBxRVbrm6U
	5x9KEBef1sZytnSRZnWZKD9UbipdrzuXDt5YYyrLDxAG5TaK9EpQrrYLp9FQjIa6
X-Received: by 2002:ac8:7f0c:0:b0:514:b17e:86f3 with SMTP id
 d75a77b69052e-5173b68d02cmr4503831cf.12.1780191482331; Sat, 30 May 2026
 18:38:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260531004748.3567875-2-yuyanghuang@google.com> <20260531005931.D4F201F00893@smtp.kernel.org>
In-Reply-To: <20260531005931.D4F201F00893@smtp.kernel.org>
From: Yuyang Huang <yuyanghuang@google.com>
Date: Sun, 31 May 2026 09:37:26 +0800
X-Gm-Features: AVHnY4JDaxYAfAHgGuWboGsrmqGbem2Csl5gpoCfrsX978gnKjtiiq7igFiEZ7I
Message-ID: <CADXeF1HwVBz3crJtAuKw_20cK4wXmoCQM73A_tZc+pc97veLjQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/2] bpf: reject BPF_PROG_QUERY with short
 uattr size
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 31, 2026 at 8:59=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Critical] The patch unconditionally rejects BPF_PROG_QUERY requests wi=
th a smaller attribute size, breaking backward compatibility for older user=
space applications.
> - [Low] Returning -EFAULT for a structure size mismatch is semantically i=
ncorrect.
> --
>
> commit 205b70f382d21dfafc18f8275384ff0f06e59f6e
> Author: Yuyang Huang <yuyanghuang@google.com>
>
> bpf: reject BPF_PROG_QUERY with short uattr size
>
> This commit modifies bpf_prog_query() to return an error if the user-prov=
ided
> attribute size is smaller than the offset of the query.revision field. Th=
is
> aims to prevent an out-of-bounds write to userspace.
>
> > diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> > index 9e91fb2fb492c..4dbf53e81a38c 100644
> > --- a/kernel/bpf/syscall.c
> > +++ b/kernel/bpf/syscall.c
> > @@ -4719,8 +4719,10 @@ static int bpf_prog_detach(const union bpf_attr =
*attr)
> >  #define BPF_PROG_QUERY_LAST_FIELD query.revision
> >
> >  static int bpf_prog_query(const union bpf_attr *attr,
> > -                       union bpf_attr __user *uattr)
> > +                       union bpf_attr __user *uattr, u32 uattr_size)
> >  {
> > +     if (uattr_size < offsetofend(union bpf_attr, query.revision))
>
> [Severity: Critical]
> Does this unconditionally reject older userspace applications that pass a
> smaller uattr_size? The BPF syscall generally maintains backward
> compatibility by allowing older binaries to pass smaller structures.
>
> By rejecting the call entirely at the top-level dispatcher, wouldn't this
> break ABI for all attachment types (like BPF_FLOW_DISSECTOR), even if tho=
se
> specific handlers never attempt to write to query.revision?
>
> Could we instead pass uattr_size down to the lower-level query handlers a=
nd
> conditionally skip writing the revision field to user space when the prov=
ided
> buffer size is insufficient?
>
> > +             return -EFAULT;
>
> [Severity: Low]
> Is -EFAULT the correct error code for a structure size mismatch?
>
> Standard practice usually returns -EINVAL (or -E2BIG) for mismatched or
> inadequate sizes. -EFAULT typically indicates an invalid memory address
> during a copy operation, which might mislead userspace developers trying =
to
> debug their applications.
>
> >       if (!bpf_net_capable())
> >               return -EPERM;
> >       if (CHECK_ATTR(BPF_PROG_QUERY))
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260531004748.35=
67875-1-yuyanghuang@google.com?part=3D1

The proposal in the patch is implemented based on the suggestion from
the previous review thread:
https://lore.kernel.org/bpf/DIUR88219HWQ.26T4D7ZX8CNTC@gmail.com/
