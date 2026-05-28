Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BD513DDA4
	for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 21:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780003917; cv=pass; b=IzB1iccxJYC/0JLoYCFzPBuXuFfn4/YOEFJXR6rkEgvWr4X8wPoattx1rNqFyxbf7qXyHfZUhSyy3lCMKgk1Q3TZq0jaezfxeVhlNi4KAxYoKCLmI381erUnYTV8rEJYiP8xrj65cknSo64kexhcebJQtjMkzPJL8rEQvBOS7YU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780003917; c=relaxed/simple;
	bh=6B3DiZENPJKZU35Mh1YH01Eo/iEF+k7/1+GyXwN5yRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aUVjnORYvLhK6+b0jv95XJcEjiA0t3mpwR8tgzAbC06HfhXGls1NZhq3JSnyL1wgO2BOmJjgPMmAVZxfR+ZisLyDnQ1kCuHbjIUbu3k1GZYpXfdwPWPsJpGiiW6G8PluMaCpdift1lf3eNiOsrEdSPXxlngBCxZbrLf1OHGd5Uc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NZmt57kv; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NZmt57kv"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1370417c01cso5851094c88.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 14:31:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780003915; cv=none;
        d=google.com; s=arc-20240605;
        b=NApNfyNgDAJGv9iRbJ8/S+0ZPJcCAU621Y4XtUGQ/RRTG4lfsDi7wj9kd4ZuUdzor+
         4H+XPvmoPAj3Hl9uCIGBX8BRlgvVdar2i7osJKsgv9SceqLhFpzchBda/qgJC21Lu6D/
         r8+7YMTBHtuENw0KWmoP9A9xslxWmhXVx4+T16n1ewQhsBqMn/Uv05QMHSPbynwSrS6L
         ZA3WEB9Iq1mpO8qOoGR1UoCCQ1psrpw35+4qCmcu4KMhvJi2miI5fbul3+gQfYhFmNON
         lMRr/XT2uJ1hg8xQOkeN75pP1Ikr/Y8hlARY+JxcniuKTfNC4nZp2U/QQ6igYkoagmzQ
         lR5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/RhTlmb6yp6u74xKfUUPWy3UF0l67fTPbFlglmRNEoM=;
        fh=0zVHGC//SC94CWFKHtFt4lnskmkXkJNNy7lE0FDd3Ck=;
        b=T5azhyxPwoxVz+zWjgDFv041rmyJ2r7JsxkXWWFVWGZJ9KUrhUgOZ370BRxndp2aqC
         DNiJ+IsnEWI4QtEKqLEm3BbbyTDAbG0qftwRQncq8skdWn+fCD7xX1LOrxVyfBOKdY3Y
         ZdIzg4Ls703TGpJgI5Ob+GWG9EOA5kwZ19J0L54PoLMcG/dqFOuWvh5js4HwA4eWj6c/
         yOZvyOhexwFhl9fak9eBYjiUXsmN4IxOYLPmM1TUqa6HMOsW1qfcrauTDLX/h1Yz5sHD
         0H4gUldMDQArpVZEvz5itJnGlTVWiwv7qr8+xR2MVaGIONIIdxznM1qZ+F/k5NB5Jf0I
         q18w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780003915; x=1780608715; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RhTlmb6yp6u74xKfUUPWy3UF0l67fTPbFlglmRNEoM=;
        b=NZmt57kv0UcaDjxyBHRlXgRRmrqoAZaFvBPeh4bght5Oz6msy2xSCdpH8teKhFV0hS
         mBt69sdYxr6XyetCmjOC1eIs2UUxKH3pWuKvN+bgWBZroBkAOhy7lv+B62mertD4QUyB
         kEThbWp4fDpnYwQw6flLnUp1yZykWGJuNfvmuIhKx3dA3+mgThjdw4agpuAcVLLE8vJW
         EcIKmwUfr8lY93UwUfz6xqocKC3OAnURLtPxaLB3Hl4J1KVIfLiQwB3bHa3mwOVdK47z
         Rii0Bn1rPnRyRiK1I5esb4UxMUcbsBqaDFiSjBhPgPxa+iKjMi8IOnvEyjU8SYrGkAMP
         52wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780003915; x=1780608715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/RhTlmb6yp6u74xKfUUPWy3UF0l67fTPbFlglmRNEoM=;
        b=Z7ssgUW8ycFnrvBr6Wa7C1XZV48tlBMbZNnT56S2IGIwhc/Pzo/S2oJbu+ex4xkwMT
         Geyciurp7owdrhoLzP+5V1cCZ9N8MEbuDBjuTrWvTe1ns8uEGJ1OTG30HwLPLQzegIW7
         r4E8Thi5K5fID6rmnFijnoM0BfhLcY71j2nzgGhA4tJmOVvHC2KKbgB6za2ZvQIQ/1AG
         qPTwM4Gd3gmqNGybmSzEWyFI4buqu3UFlFoSW5Lgihrn0MvgkyGFBdWpf7dNEpnTp+6Y
         R3CRf/fZCjqOiG2+POkX6oYk3/+LgMR5STnCFAs8bdoXuo2S0NU80neOZTPDWStgi4Wm
         B9lg==
X-Gm-Message-State: AOJu0YznreMJO7b92WZ7t1Xc61i3aLd1NDbIF2CEHijqMKD1sncWKgs6
	wVsDrf/znk88TAQuA55kbgPwoCjZIOTkGuD+qznxX8HEa2UDqAsEI7xas90GgImoMia8RwMarXc
	DHKeYeQESBoHE3gz4eyhkgmsYdsy7fK5JIU+YK62pjljO5cRKhv0V1tZs
X-Gm-Gg: Acq92OE62rzGnZ+c5VoNdiXd/cOVkD46kZ9kUnMgFHqkJConRP76HL3szwsoCPHxgTi
	BzF97kUjBN6pmvN5GPtaZCbydNxiu6gul45Nqy+cRngfqrDAEckDE80KcAOPj9ojcXlAH6HKlzk
	PrCz+Hc+9FH2Kp9r1jYFMU0t1RR+BzoY6mKI2Pi/1+oZ+yB6ES4BWlGQKwrI+E4facqdrUgBnqI
	y7FJb67VeYqNjDH8nGdlU2StzLmeVpZIcrvmSXq1TnGFpGMVI4E/SH0ZisQm+E0bY+txYOcB4W/
	HEA92YXe7XtPBJhQ
X-Received: by 2002:a05:7022:226:b0:133:3bb1:8d40 with SMTP id
 a92af1059eb24-137aecb4d6dmr73964c88.15.1780003914784; Thu, 28 May 2026
 14:31:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260527221934.3830896-1-ctshao@google.com> <20260528001117.3BBF11F00A3A@smtp.kernel.org>
In-Reply-To: <20260528001117.3BBF11F00A3A@smtp.kernel.org>
From: Chun-Tse Shao <ctshao@google.com>
Date: Thu, 28 May 2026 14:31:42 -0700
X-Gm-Features: AVHnY4IwiF5Pg_HQ1EZNPYq3-_irgF0d3bl9E1urKgBMTUCG97CRDlKg4dpcn-8
Message-ID: <CAJpZYjUiNdN3a6y+8rs=YP2Mgtj6EQJnkiB9TN_suWd8fGkoEg@mail.gmail.com>
Subject: Re: [PATCH RESEND v7 1/2] perf pmu intel: Generalize SNC cpumask
 adjustment for multiple platforms
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 5:11=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [Critical] An integer overflow in `uncore_cha_snc()` can result in a ne=
gative Sub-NUMA Clustering (SNC) node index. This bypasses the upper-bound =
check against `MAX_SNCS` and causes subsequent out-of-bounds array accesses=
.
> --
>
> commit be394e8b7ddbe730c3fc40fb608337fe19c7b33b
> Author: Chun-Tse Shao <ctshao@google.com>
>
> perf pmu intel: Generalize SNC cpumask adjustment for multiple platforms
>
> This commit generalizes the Sub-NUMA Clustering (SNC) logic previously
> specific to Granite Rapids to support multiple Intel platforms. It uses
> CPUID to determine SNC support and caches various PMU configurations
> to improve thread safety.
>
> > diff --git a/tools/perf/arch/x86/util/pmu.c b/tools/perf/arch/x86/util/=
pmu.c
> > index 7c9d238922a6c..9b00d5720fb7a 100644
> > --- a/tools/perf/arch/x86/util/pmu.c
> > +++ b/tools/perf/arch/x86/util/pmu.c
>
> [ ... ]
>
> > @@ -121,46 +142,73 @@ static int uncore_cha_snc(struct perf_pmu *pmu)
> >               return 0;
> >       }
> >       chas_per_node =3D num_cha / snc_nodes;
> > +     if (chas_per_node =3D=3D 0) {
> > +             pr_warning("Unexpected: chas_per_node is 0 (num_cha=3D%d,=
 snc_nodes=3D%d)\n",
> > +                        num_cha, snc_nodes);
> > +             return 0;
> > +     }
> >       cha_snc =3D cha_num / chas_per_node;
> >
> >       /* Range check cha_snc. for unexpected out of bounds. */
> >       return cha_snc >=3D MAX_SNCS ? 0 : cha_snc;
>
> [Severity: Critical]
> This is a pre-existing issue, but does this range check safely handle ver=
y
> large values for cha_num?
>
> Since cha_num is parsed as an unsigned int via sscanf() from the PMU name=
,
> and cha_snc is a signed int, a sufficiently large cha_num could cause the
> division result to overflow into a negative value.

I think it is very unlikely we would see cha_num > INT_MAX.
Since that is a pre-existing issue, I prefer to fix it separately.

Thanks,
CT

>
> If cha_snc becomes negative, the cha_snc >=3D MAX_SNCS check evaluates to
> false, allowing the function to return a negative index.
>
> Could this negative index then cause out-of-bounds array accesses when us=
ed
> later in uncore_cha_imc_compute_cpu_adjust()?
>
> uncore_cha_imc_compute_cpu_adjust() {
>     static bool checked_cpu_adjust[MAX_SNCS];
>     ...
>     if (checked_cpu_adjust[pmu_snc])
>     ...
> }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527221934.38=
30896-1-ctshao@google.com?part=3D1
