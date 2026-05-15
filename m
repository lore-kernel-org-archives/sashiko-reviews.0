Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB903806DC
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 19:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778874035; cv=pass; b=MrBymc5dJexEabVUA5ZyAmcFzznsEuSLVXtGGozJylB14tUMD0E0+aCpOJAZ8kNK4r4DLRhhFnRsekIKHOumhAFs9xUnPfETmdrS4m7CLknAnDNoEo9ZpDlF3Hrv6aWi89EytbfCczMpbCROS0l8z72NBAxUwn9PxVfwRMms+oY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778874035; c=relaxed/simple;
	bh=YKwe6jSULfstrnXD5pmaH7VOhInZQUPQ48ryfkK9oy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lgw18UTRxGCSoICQX5VdzSeQ2/FMuUoIJTUeocPwD7HJ+hsSE5utB8AOXf4/dD7Nt7WmSNRfUee1lhjRaDk/jTzp338Ud9cnr5RrU8hKRRjdu+f8Ek5TVOwnzUVaazBMEZSqySdx7VF4JjLqcSB19xCtCOEK0Avnu97r6ndZv5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eK3nNobc; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eK3nNobc"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2b46da8c48eso6805ad.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 12:40:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778874033; cv=none;
        d=google.com; s=arc-20240605;
        b=BaWWG+4Krh/24R+ugAyNKnc9E7xxq5+jbVZmMOF2Muux791qxcS/cZgjRrXe5DaCLE
         AgKtGxUXj7kfB+Z0G912Gf6NuxTYpQn0yG3/pk5T4MnivafFUIswCk52dMifpp9zMHqW
         SWobMo43s8eKpkiDlEZvR8txZzdhIJB/qIUcWpB2Ye0yciIH96GpjePKZ7aONg7x2o+p
         b6U7LwSS4nuVEM6jYd1ew650KZkCo/QArWowdrR54WUorrA45eEFnHQEqOfwt3B4uXh3
         mv4x87+a5MQDBCUxxDzvr/vgEUkTdzxywgUF+hWI0a85cgsoB766aoSpcJhHJlrddnZl
         Gw+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YKwe6jSULfstrnXD5pmaH7VOhInZQUPQ48ryfkK9oy0=;
        fh=6/+p72sCy7cAFRjOIdttegdodMuDLgxAAg/Wgl3twWY=;
        b=Ltph5POZ6LdANkeK9yBtUjayF8ipfTi3CervvOa+w2ApBxE1ZC/fUe2RjIZ1j6m5ju
         1OnC36o5K2tN/3RaKwFsycY7Nge4HScb4pwXx/CB45nag1TJc2kLpBog7yNJQtQwXQnP
         EohacsQEOs6ZH/T5SjHP2AegqJ7izAVXgOqaMfwuMXuKhPtcpBIiOYVZQeOEgKVyNMfF
         f+j6RIfbiQn9veKifNxi33GnGuxLZJ5vJtjPymqVFVp2MbHn4V0zxgLJcr5RMM3kQmZS
         lTppq9n7cUil+9DVqnkVs2ZhXYabBMsdZcCYfx2psGWyWTt2yTNyXZDHM3AMy2WVY90g
         vwbg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778874033; x=1779478833; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKwe6jSULfstrnXD5pmaH7VOhInZQUPQ48ryfkK9oy0=;
        b=eK3nNobccnz/3xaU1O5UMDI4+HqhbSF+DD0gUhDmDNjgLvr73PYF038fPGGp+qboJD
         HjlRPT1Vb0HH/vxsbUhTlZwXUoJ2QvW/57PfuoPFXWvIjIKNZq8sPISWOUZPrHMwCG/t
         pDDpP0rgd5gPhgtwsazhSZhFtjgKdSyeKivN5GB/LUNOBkp3p6b3IJN1/JuQzEBRjxW+
         nF0aLDuawOBjjSTwGl2CBB8NiKhbkeSE41zYl+wGBY00GMrjgZFq7je1P7tGVgedBwc8
         eXOIEjLabEFQ64g2Dg3ZTCsPQpSPWrN1xFt++pWqoTMT31xiDGUUBAQiYlKXRc0IVAMT
         iyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778874033; x=1779478833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YKwe6jSULfstrnXD5pmaH7VOhInZQUPQ48ryfkK9oy0=;
        b=PrxP0g8YCW59BXZ6IsMgbANWlIhdVPjc2vkQhGvUdIXEtxHtyBVpsyYsOhhui8JkXw
         wqJ3YdTfa6Vh3DaphTkHh9UVey7I41vLb0JmY6aZB95aHv7C4U00kdJ4skaZqaXi3GD7
         wkbmEF7BP8+YghHzpM+1qcZ+F6aVAwTI7FVryPaWPOUHfoSoQFbHHURVl/HGrt3nqO9c
         gXIF9/ADDuRUmmVEMgaW6S5k/J/hFxkm4GgZV3qM09/+zjbKYiIoIwDYGhhC8gJhGx5V
         iwIeJDOvNJmYFVxb3UMXPYCX7Myt4BmgZvcCwKuo7VSVspXQrgKh+scZblQ0RrB+RxYt
         ypDg==
X-Gm-Message-State: AOJu0Yw/zrsXmqaEcxMtYDyKuZhvN5MDIy0Ie3tGvVUvUD5FIlsUGPZz
	wrx0M6COuL59b/wuJ8AzfVQNKd7AK8S78ldd68nokqf2ZlNriZc172vAWG7hSQKSlToHvh4jJZG
	bE4KTAQgSBuVKpvXkrSOOTb3GSPUyz65TZ6RhQOndAa60gu0+aIWU+Nmg
X-Gm-Gg: Acq92OFMxK2oV0heXcqlLA3nVN00Z+SAkKynznIuNH4Gm8wmp58fl/8Mu9B8RU2E4YQ
	TBGdI2YGKGe+e6YchXZbRoSlg2xEf77aQ1beAy012q5FjeRY4PMet376QsuOvfDKzeclpjl0lkw
	XYd0YY+Xh6EJzrTmJiStqyahht+TUTddltCtc3iALFLeOpXm9PpmbN0TkNUXAzboJzokr+EfV3Y
	JyEuOlq/UF1nCr9dwbFOUyT3ctul4MHH+jadrMLA3nkKtGUBohgIhcg5onCLZ3PnyE3KhfXMahY
	ommRO7wU/5mrJFdu7Zvf6CE0wOx0fQ==
X-Received: by 2002:a17:903:28e:b0:2bd:6dad:3df8 with SMTP id
 d9443c01a7336-2bda0ea389amr433985ad.22.1778874032694; Fri, 15 May 2026
 12:40:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260515180806.246914-1-sigmatwojastara@gmail.com> <20260515181547.99D82C2BCB0@smtp.kernel.org>
In-Reply-To: <20260515181547.99D82C2BCB0@smtp.kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Fri, 15 May 2026 12:40:21 -0700
X-Gm-Features: AVHnY4KI1lrja2wjIoxRnOM6Okw9ETfkCmzYrHCz9L_mjetwnnwff4VNJUH4ucQ
Message-ID: <CAP-5=fUV6W=TBXbCHARMJwm1Pjb4uJCO82EZ3fjU7jsiR51t0w@mail.gmail.com>
Subject: Re: [PATCH] treewide: replace /usr/bin/python3 shebangs with env python3
To: sashiko-reviews@lists.linux.dev
Cc: Oli R <sigmatwojastara@gmail.com>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 11:35=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Commit message states it replaces `#!/usr/bin/python3` shebang=
s and causes no functional changes, but actually changes `#!/usr/bin/python=
` to `#!/usr/bin/env python3` in `tools/perf/tests/shell/lib/perf_json_outp=
ut_lint.py`.
> --
>
> commit 7d3e9689ede53be80434b3ba8cd07c27777d11ad
> Author: Oli R <sigmatwojastara@gmail.com>
>
> treewide: replace /usr/bin/python3 shebangs with env python3
>
> This commit replaces hardcoded /usr/bin/python3 interpreter paths with
> /usr/bin/env python3 to improve portability.
>
> > treewide: replace /usr/bin/python3 shebangs with env python3
> [ ... ]
> > No functional changes intended.
>
> Is this description accurate?
>
> [ ... ]
>
> > diff --git a/tools/perf/tests/shell/lib/perf_json_output_lint.py b/tool=
s/perf/tests/shell/lib/perf_json_output_lint.py
> > index dafbde56cc76f..dccafd507bb79 100644
> > --- a/tools/perf/tests/shell/lib/perf_json_output_lint.py
> > +++ b/tools/perf/tests/shell/lib/perf_json_output_lint.py
> > @@ -1,4 +1,4 @@
> > -#!/usr/bin/python
> > +#!/usr/bin/env python3
>
> Could this affect functionality on systems where python defaults to Pytho=
n 2
> or is managed differently?

The change looks good to me, but I wonder it should be split into
separate patches for the different subsystems. We do not care about
Python 2, so I think some review prompt improvements are necessary.

Thanks!
Ian

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515180806.24=
6914-1-sigmatwojastara@gmail.com?part=3D1
>
