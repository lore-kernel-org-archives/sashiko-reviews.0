Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A853F211A
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 07:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827759; cv=pass; b=p8RwKQiTlBctIRq3W8g/K8u0cr3gPx3ms1DmR0mNmRo7FnRE5YRotBIkWnL8OJK+wlxA22E87lPgQGfdezSFN2r0L0SdogjHH6htgxVD98OSBtqr9xxXexsx4dYIeeGKTdnlIXzyp5SclkHL9sdE29Oc0kPZ0qgIQwNG3+9eJFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827759; c=relaxed/simple;
	bh=8X1/tFmkNvucKU55SD9C0MQcuAuBHd6BgGuyErlYnmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKFbIlwDVxiVQHmd+CTw7VYKXhDuR7mXV2y6hpW7zD204hpRMHZK2d76qM4zqHCOSPtHzVw3JGBo6RKBttDzG56KobCCXlD0rDFvL6RMnTTKefjzpwnIWhXg1szBp0qiut+1RXltsFDPbQ9jSQc3TikBPKa5rc/dNzfPFuu0RaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etM//6yT; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etM//6yT"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-81ff017d420so10731477b3.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 00:15:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785827757; cv=none;
        d=google.com; s=arc-20260327;
        b=N3nAFLmKvRtJjlVz2Dz61UVhTufOWgUsFASWUlpn7bTk8Ne1TCFeM3AZPmAqJl3Rqe
         k+AkiKGWDrYSsa15YHRnad5VYIFFjcy20wfkUfjf19LVmBmiFUGNnRe/82oJD0oteksv
         2+HKYGnNEKS4VGfwPqZCfUP5Cp2DoL/WckbKvuVghhx36r++tbGCVTApICUE8BiM6dmd
         Vu0wiToTSSc95heqRPCl/8b9eXcJ0+FSvfeeAxcTkf65knn3lHYRlcoUDCiGpp/Bs1Mv
         1ZFOqov/oamhjp7LKLhxEvA/iJQdu430QcThj22owugrW6jCqT+xXKvO8MZFcwa/ewOq
         86QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UZdXVSYuS8SOnebG5/dNG4Br4MK+c8iN1GqhwiKB41U=;
        fh=myfyTS+96RL1CYke+TvHidoU78tjDkYzQN2QzJVyJYs=;
        b=LkhlbZhKcIvwqa9QKMjCdfLCGs5klFwuqqk8x39sxDZRzq0NTUKp/NLZBXlF9jNx8w
         betBF2cpODNRtnoysjZHV0xpN4Y92XD4rc75NqdNw6YsDNaJL+OyrFhY0naOr8pB0CyU
         EKijhV4ChzxfFUwcWb+V1ePWtMlSuUzt50Bl6Wq8SqWbdGa30GovgRJB8TC1fP09kkDR
         xQpxbQ//YShKxwFxo4KWPuh7wLKqnxtUMZjkHsyqNt0CXyRzsbEDFFw1aQCAQtZJYIiv
         MLgGeI6/HuDFqkWhC9Ik0EZ51pZdsMrfosNLbIgFAEsUnratDJ313Qxe1Kxkfkf2+YeP
         WzBA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785827757; x=1786432557; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UZdXVSYuS8SOnebG5/dNG4Br4MK+c8iN1GqhwiKB41U=;
        b=etM//6yTYz2tzBpIGha7rkQWcqhMW30qhyZLFPre/+rdojEAgTxhDg4o8lQAaU9VU6
         A1bYqBMyIQEou58v36Wn1PujQ17oxmLlQYMtQBsoxcrutqv1IHK5E3ohkX1j9y1/tnMr
         Dwrb7pPwxdRV6+6p9xoqysPd9thvaoGXu9REfGvFLvzxM+8UW6Z93CjVSZPOmNM36z94
         +K6LAw4dH1NKvkBSG1BWu+9uyqIPXoB664Ow1OIoEqLi1QA8Upn+F2PUH21LonSFd8F8
         HalapXIgBGc9mcZF6tMsuyKbYMHzQ6des4Xov7JyjHvGj7USQWypD4fcJ8pdPbo8FJnD
         Juug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785827757; x=1786432557;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UZdXVSYuS8SOnebG5/dNG4Br4MK+c8iN1GqhwiKB41U=;
        b=lfHVZAPJi/4cESilH2RmTclVSFu1GqRBGLGZXysAe8Sh/ZuWPuX1napJbBJU8icbVC
         BXrRVImLoi42KwWTNjTxjs8L5gMAJVjDnGeCIL/kPnFhO5fgmVuC7bWkpQ3kqnRVmI0k
         yVq+AQHe/0ITIjCvKTfYR8b8E1OM7iDz+xH1RrOXZ+bYbFgwliVT1gT7YGhh9K16fF7G
         VzejLNFHC8wbY3nXzRQawklQYRM4pN6XIWhnOXaaboxdSfrDwj2CEWzCrRPxUewNo3QA
         vq3Suw4l6W6gkpHXexcLLLcTKDzroot0YGO8mzL26BYO+TQ5jPJjWJ2jCK6fQ1871clR
         PsiA==
X-Gm-Message-State: AOJu0YxGcr8vMzTX/sn7if1ntaMRDU4hc/d+AARZHNhkiI7MyXLyFJlX
	WmBtrvvJhXFwfiUQJozJlIhCDdKb3HmR0oL7tQMfV6pWT4mMD6S3tbQ1SHVPSzN57ZMt0Scl45T
	s/71q2GpfwUC8zOsN4EbzrGbunGv2AW4t7NbFJG4=
X-Gm-Gg: AR+sD12fe+5167W432KHpthtEjHjgLYw5EczQmiPpjqbs9i4ZnnBdjeidH/AN380O63
	VV54VKMoInasA9ysHEPoAoF6aAS3hHED4LgilZKVEtPBek3Y6PqNX7xYNjKgjkoIyhGUlkdwPbI
	401btPy5egmKL3mhPwZ0hhp7K194Yb6SwsFV+muDhoNndgHShM1mf6qOOIB5H0a1J1Qf5KoPPGy
	Ng8OTKUmOIdWj2WQBMM3A3aocdAGUWGWRSw4tp+8w3ItNX5gsRc2y8aj5Bw9ecBVxh9CcedMlCZ
	vIZBFDzll9910R+7jqLscA7J60SQPVcbW1m90LFBJEGjGCB4+Yrv0rOMxB+8g5MqSdXphJlohQZ
	eYg==
X-Received: by 2002:a05:690c:3387:b0:7ef:9fd9:db07 with SMTP id
 00721157ae682-81fd4e786c0mr156961537b3.12.1785827756762; Tue, 04 Aug 2026
 00:15:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260804065010.44922-1-laoar.shao@gmail.com> <20260804065010.44922-4-laoar.shao@gmail.com>
 <20260804070310.4EBB21F000E9@smtp.kernel.org>
In-Reply-To: <20260804070310.4EBB21F000E9@smtp.kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Tue, 4 Aug 2026 15:15:18 +0800
X-Gm-Features: AUfX_mz0mPAcZttxPV8arJ9zHdDybvfjJB3aD6W_N_l7e8YsDdlZKGrKPkEdwkE
Message-ID: <CALOAHbDmZBahx3Qsvfs5Y-qV+CvMg7FDaXoN1bj+m+EcKd04CA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 3/4] livepatch: Implement replace set for scoped
 atomic replace
To: sashiko-reviews@lists.linux.dev
Cc: pmladek@suse.com, jpoimboe@kernel.org, joe.lawrence@redhat.com, 
	jikos@kernel.org, mbenes@suse.cz, song@kernel.org, 
	live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 3:03=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Dynamically allocated `funcs` arrays are leaked on KLP_OBSOLET=
ES parsing failure.
> --
>
> --- Patch [3]: [RFC PATCH v4 3/4] livepatch: Implement replace set for sc=
oped atomic replace ---
> commit d186609c1a3dbe210857d0040f657fa918504faf
> Author: Yafang Shao <laoar.shao@gmail.com>
> Subject: livepatch: Implement replace set for scoped atomic replace
>
> This commit introduces a more flexible atomic replace model for livepatch=
es
> using provides and obsoletes fields. A new patch will replace any existin=
g
> patch with a matching provides ID or any ID listed in its obsoletes array=
.
> The klp-build script and init code are updated to parse and validate thes=
e
> new fields.
>
> > diff --git a/scripts/livepatch/init.c b/scripts/livepatch/init.c
> > --- a/scripts/livepatch/init.c
> > +++ b/scripts/livepatch/init.c
> [ ... ]
> > @@ -72,10 +73,73 @@ static int __init livepatch_mod_init(void)
> [ ... ]
> > +#ifdef KLP_OBSOLETES
> > +     /*
> > +      * Parse KLP_OBSOLETES string (format: "0,1,2" or "0" or empty)
> > +      * and convert to unsigned int array for patch->obsoletes
> > +      *
> > +      * Note: KLP_OBSOLETES is always defined and includes at least th=
e
> > +      * provides ID, ensuring the patch replaces old patches with same=
 ID.
> > +      */
> > +     {
> > +             unsigned int *obs_array;
> > +             unsigned int count =3D 1;
> > +             char *obsoletes_str;
> > +             char *token, *str;
> > +             int i =3D 0;
> > +
> > +             for (str =3D (char *)KLP_OBSOLETES; *str; str++) {
> > +                     if (*str =3D=3D ',')
> > +                             count++;
> > +             }
> > +
> > +             obsoletes_str =3D kstrdup(KLP_OBSOLETES, GFP_KERNEL);
> > +             if (!obsoletes_str) {
> > +                     ret =3D -ENOMEM;
> > +                     goto err_free_objs;
> > +             }
> > +
> > +             obs_array =3D kmalloc_array(count, sizeof(unsigned int), =
GFP_KERNEL);
> > +             if (!obs_array) {
> > +                     kfree(obsoletes_str);
> > +                     ret =3D -ENOMEM;
> > +                     goto err_free_objs;
> > +             }
> > +
> > +             str =3D obsoletes_str;
> > +             while ((token =3D strsep(&str, ",")) !=3D NULL) {
> > +                     unsigned int val;
> > +
> > +                     ret =3D kstrtouint(token, 10, &val);
> > +                     if (ret) {
> > +                             kfree(obsoletes_str);
> > +                             kfree(obs_array);
> > +                             goto err_free_objs;
> > +                     }
> > +                     obs_array[i++] =3D val;
> > +             }
>
> [Severity: Medium]
> Does this code leak the funcs arrays on error?
>
> Earlier in livepatch_mod_init(), the funcs arrays are dynamically allocat=
ed
> for each object in a loop:
>
>         funcs =3D kzalloc(sizeof(struct klp_func) * (nr_funcs + 1), GFP_K=
ERNEL);
>         ...
>         obj->funcs =3D funcs;
>
> If KLP_OBSOLETES parsing fails during string duplication, array allocatio=
n,
> or integer conversion, the error paths jump to err_free_objs. It appears
> that the cleanup label only frees the objs array itself but leaves the
> individual obj->funcs arrays allocated:
>
> err_free_objs:
>         kfree(objs);
> err_free_patch:
>         kfree(patch);

You are right.
Furthermore, there is a pre-existing bug in the error path that should
be fixed as well:

--- a/scripts/livepatch/init.c
+++ b/scripts/livepatch/init.c
@@ -52,7 +52,7 @@ static int __init livepatch_mod_init(void)
                if (!funcs) {
                        ret =3D -ENOMEM;
                        for (int j =3D 0; j < i; j++)
-                               kfree(objs[i].funcs);
+                               kfree(objs[j].funcs);
                        goto err_free_objs;
                }

--=20
Regards
Yafang
