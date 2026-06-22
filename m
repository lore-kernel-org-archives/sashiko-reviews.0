Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EDB342523
	for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 18:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782152276; cv=pass; b=pe+ga+Rtv/s6NX3MtSjY6b2+Jo4AGzgahBfgLbMUHRaflQMThDtp4Yvauc+qyVUaAOH/0vYe8MPtJlu0uTy7sIe0FJ9Dou14g6Gzc8nxscNYRAPS5x2BDLzgl2+MVvp2s9wQUlvj4VzsI1NO3Fk2dt5eLVYP4ar1YRGZN1QjKXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782152276; c=relaxed/simple;
	bh=m11RxMrybFbYq1aegOwyhpbXAUpIQLIK+I74ptbAttQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bVazkOXTIn8gyXdoyXj4eBOLtPW8ROrSyl6EW4QIQJSIgQrtzsOwylGclD74wNgOMtCC/cczttstaz/VNEMcMiabNgNU3h6ElOGNpwaT9BPP14TAeIc/Y2L6ro+DzK7QuqMf4cptYRwt4MnRB7JV8w154TAdpUfb14d+cWUr1V8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nonh0JGW; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nonh0JGW"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c6a4eccab1so4915ad.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 11:17:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782152274; cv=none;
        d=google.com; s=arc-20260327;
        b=ph0Tp5TnnUWUkJq5M5ymADwnObivj252FX2M/Lb4e8ni3oj0G8Mq48vhVQYhmtI2kK
         F9Db4iZHt3KRK51xJg+4HEhlV8WCnSGeH91B7dNXsfRF1r51blNaec2ldLRjaRUq5KmO
         vEmAO7wTQUizdglU60FIch4OuhrYEINAU1UIUm51bxpsC3vTIxNiWOy4eRMhHfgOLIMw
         SxXrf/UVK1nTe+FW7RA2j76d+U3semWurPge8lnJDQrXlk5Ov8vV47ZvloON1ewbv/hN
         Hf5pBFw3wFPKFHJNPXtizq2kHo59ovPZyBvnhPHb+DPWGOv8VKzEodraIUU5E2rtsLU0
         V+5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xtFt0nsYRVxh9pjtBHg13JFYnpuDwE2MjabpRY6kgzQ=;
        fh=RE7v2lIzuaEZ+NODFtxqdkdFUzMEfiO5ZgljgGFmpAY=;
        b=kDgpU/2sN0umtaNVXCVIwY0Mh9J/WNB0b71GRdxfFCbaaXTt1Y4wVuU+Zj2Xkx3Kyg
         kFrdsv/UfOMxNiEuPmCQ86bL9j0P8ceI8RtbBkTbJZqF9TT+kqE/dXFDx1sw960mWwKO
         LPTq+zdh5REHxd1Jv3p14zGFTOpbBFdtcvAvWAsvukXjZ93xEtt7Y90cmKpm1R6mJQwK
         KR/eS6P2bPj3vqnWhJlkTB0ls7tkN/Zm2Zlcfou9oqo4Ieq3jQcv5t891y98O4zlP6Od
         hrVWdNpybH4VOzd+fLDZzVNnUbZB3RSsPrwWxZ6fxKG6z+xV7knsBN7J26U8HOsqrdDE
         gk2A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782152274; x=1782757074; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xtFt0nsYRVxh9pjtBHg13JFYnpuDwE2MjabpRY6kgzQ=;
        b=nonh0JGWfyVn+8oW645JQKRUMBq/j1/mra2ONi+J8mf3ezODdbTafa+LUBUdJbI9KJ
         xl+GoXBRfFkbyakwQde2DVZgdFa2MFowEiGn0FjyUkIPbNWciX7tRK1AnPK+9IfdAuak
         0aGl11M/FLnPkjxjn3c8WeC10mIr/5x95QGNIcaY8Ct2Qg+k9bEwSICAAXIRjE0oSdFz
         LZx6hxfZ2zZaSdZG6RD/171c1gvQJ4fE+7gwKrfn0foGsmKEiGoncXA72zcGs5c/Jy2f
         Zhb+5Q6W3w5eVd95C+2Vcw9I/oSWJ1puZd+EaENqI5ROHWgn3Zz/N8LU30isDM6j9/Y2
         sLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782152274; x=1782757074;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xtFt0nsYRVxh9pjtBHg13JFYnpuDwE2MjabpRY6kgzQ=;
        b=bwSVmdC8jewnXdaQ+7a8tcmyixHMUuhT08z3S4+oHQ+NvCdTAd15/G1DZ2eFwJJmOQ
         BXD/C5GlwxtqRJQ9UVEs0zQ5NZDLsHKnlYLunzR08Qz14jWx+utkOJle8nl7qlwk42LA
         Duw/jzsxwYFoPh6SjEtGQI6ITfHg4RoEaLshS0z/d7ZNN6X1G9dVQeNIY6nDL0ihBGEj
         6IO8T02X164koUeETqiDCYZ1pSBXqwcd1/L4sWHJva87fc8brZlpKUKGVd40B3A/Rcyg
         tMsK5VOtmoS+/BJ/GjAk5PVNmAjRlfl8NdpEW1IZAC1vQff0cuCWjCnJDkaTMyBz7jA1
         FvjQ==
X-Gm-Message-State: AOJu0YzLHgL4J/km4fZC83tIUQ2pfWHr2gXfcoVWWKFvd3531kOgrS37
	0w/Ws8nKIwIxO8qMVO+NoFbKPzOafBIVqxcg3nfBAmIy7fhmcvrSfNEfSNw90g0IWT1t/pSOPbi
	inzVcK57F55Bs51sSbl8YXlt1fngBKvCmZf70JGSsb/bv4CJaEJlf2T3e
X-Gm-Gg: AfdE7cnuusSfuVdOwbu6uvDf1/EFwEtEcgfRuQRkg6fqepuQ41pNeHUXQ1Lq0nQSWMH
	AIXRLPN3KcO+wwD7XvAxHP3gkOVBVTzW+PF2Fbovtf9ISGXq1DliWAysFtiaI+i9Vwew++IPJXO
	d5N4/cgU2u/af9s+I5xkLi5mXH1zAPmUeKgBIiqv+CyG87MuMcnHMEagIlKm72jXIfkjWFbgz68
	KQKMMHA9d5N6Ajs3ewMLDSARMWOlzBpPBZt/eOV4znb/MDHfAEF0oa2ZcyuXmeJhCa4MGQV6A==
X-Received: by 2002:a17:902:e842:b0:2c1:ee6e:4e4e with SMTP id
 d9443c01a7336-2c7c55c4688mr220605ad.31.1782152273465; Mon, 22 Jun 2026
 11:17:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260619093531.4038655-1-tmricht@linux.ibm.com> <20260619094233.CBA9B1F000E9@smtp.kernel.org>
In-Reply-To: <20260619094233.CBA9B1F000E9@smtp.kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 22 Jun 2026 11:17:41 -0700
X-Gm-Features: AVVi8CffVrqrwBpGjIxgkJVAl6Ad7IfgqkmawX297zMXF4nP1v65i27NURFYVVM
Message-ID: <CAP-5=fUJbh=dXiadCJJ4d_prCxox1G0WW_WODwSHC4DvwWuQag@mail.gmail.com>
Subject: Re: [PATCH linux-next] perf test: Skip failing 'perf test aslr' test case
To: sashiko-reviews@lists.linux.dev, Thomas Richter <tmricht@linux.ibm.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: linux-perf-users@vger.kernel.org, linux-s390@vger.kernel.org, 
	Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Namhyung Kim <namhyung@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2026 at 2:42=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] Unconditionally setting `err=3D2` when skipping `test_callchai=
n_aslr` masks prior test failures.
> - [Medium] Skipping the test incorrectly triggers the test failure cleanu=
p path, leaking the temporary directory in `/tmp/`.
> --
>
> commit d772895777a1677561d1802ac157c32ce73e1379
> Author: Thomas Richter <tmricht@linux.ibm.com>
>
> perf test: Skip failing 'perf test aslr' test case
>
> The test case 'perf test aslr' fails on s390. This commit fixes the failu=
re
> by skipping the subtest test_callchain_aslr and emitting a hint when the
> --call-graph dwarf option is selected.
>
> Fixes: 60bc9fbc0589 ("perf test: Add inject ASLR test")
>
> > diff --git a/tools/perf/tests/shell/inject_aslr.sh b/tools/perf/tests/s=
hell/inject_aslr.sh
> > index c00461828ea79..7fdb43679dc84 100755
> > --- a/tools/perf/tests/shell/inject_aslr.sh
> > +++ b/tools/perf/tests/shell/inject_aslr.sh
> > @@ -135,8 +135,15 @@ test_callchain_aslr() {
> >      echo "Callchain ASLR test [Failed - no noploop samples in original=
 file]"
> >      err=3D1
> >    elif [ -z "$new_addr" ]; then
> > -    echo "Callchain ASLR test [Failed - could not find remapped addres=
s]"
> > -    err=3D1
> > +    if perf evlist -v -i "${data}" | grep -q 'sample_type:.*STACK_USER=
'; then
> > +      echo "Dropping stack user sample as possible ASLR leak"
> > +      echo "Call-graph dwarf not supported with 'perf inject --aslr'"
> > +      echo "Callchain ASLR test [Skip]"
> > +      err=3D2
>
> [Severity: Medium]
> Does unconditionally setting err=3D2 here mask prior test failures?
>
> If an earlier subtest fails, the global err variable is set to 1. When
> test_callchain_aslr() decides to skip and assigns err=3D2, it overwrites
> this previous failure state.
>
> Since the perf test framework treats an exit code of 2 as a SKIP, the tes=
t
> suite will report the entire script as skipped, completely hiding the
> actual failure from the prior subtest.
>
> [Severity: Medium]
> Will skipping this test inadvertently trigger the test failure cleanup pa=
th
> and leak the temporary directory?
>
> The cleanup() function in tools/perf/tests/shell/inject_aslr.sh explicitl=
y
> aborts deletion if the exit code or err is non-zero:
>
> cleanup() {
>   if [ "${exit_code}" -ne 0 ] || [ "${err}" -ne 0 ]; then


Thanks for the fix Thomas! I completely agree with what you've done,
but it exposed this latent issue that we should make the exit_code/err
comparison -eq 1 rather than -ne 0. Perhaps Arnaldo can fix this, or
we can address it as a follow-up.

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

>     echo "Test failed! Preserving temp directory: ${temp_dir}"
>     return
>   fi
>   ...
> }
>
> Because cleanup() was not updated to handle the new skip state, it
> mistakenly treats err=3D2 as a test failure. This unconditionally leaves
> behind the /tmp/perf-test-aslr.XXXXXX directory every time the test skips=
.
>
> > +    else
> > +      echo "Callchain ASLR test [Failed - could not find remapped addr=
ess]"
> > +      err=3D1
> > +    fi
> >    elif [ "$orig_addr" =3D "$new_addr" ]; then
> >      echo "Callchain ASLR test [Failed - addresses are not remapped]"
> >      err=3D1
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619093531.40=
38655-1-tmricht@linux.ibm.com?part=3D1
>
