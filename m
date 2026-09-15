Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EEB4CE678
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 19:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499090; cv=pass; b=kagaoDb+pDi/GlnE9lZosZeXNK/Y98LZkyV7sveFwLW6B/brwIWydtdsUmtUin5AvnXdyaQOb/oavNYQ8R1La/N28GfRKh8DxxM7RxEeFauXf7Ar49upLreW6PceeSyO6A0ppT0TSMUAZ66uohZtTshZn28ssP4S++dXVAb4VQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499090; c=relaxed/simple;
	bh=CG49oeYgRKGkXZIpez+UfckpNF7tbwFkBXsCCjJfd80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gRP0ccZdb45dovSwQVNJGscjZWa5VeRDenXcIQiKfSIKKAFdclmMHHqPlZuHwNwqh4TH+QfeQp3AY/s/k7u4K0yqxSHty37NPJTOujRVONe08kwhwGVHVmET7BH39VCCtKeeo6Fd6sNSlmH608rCl5AIUzTC4x9hK71RS+02qwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com; spf=fail smtp.mailfrom=uber.com; dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b=le1jTG6h; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b="le1jTG6h"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f56039dso26757666b.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 12:04:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789499087; cv=none;
        d=google.com; s=arc-20260327;
        b=BQTMeG+lx24BrOegsLo5FlCO3gZYeKwgs6nvkKoVvlxYGIADq1vTyP+3bhL1RNpwv0
         5zTLMYMYSeegYCz9KEjOUb73ngbluO2VWSIwykH0VRhL3wDQT956PWelJ3NNEaVxk83c
         A9slHk+mSSv/SrA6EBQNg8qiCn1bbETdJPPjTJkU283Hn6KNOXicET8q93TPaIHvpI/E
         4j+ygcJtlXnEc+KoDhdAK7ZxKGrrIlWN8pUcoPpWl53Fh2oGUmQYZbW6coXf4OOaBo5e
         7E3Dx9HMJxiX4eTIMYdzrVDpHF33zQn4ianN1imKBU8xY7a7wGa3OIkQ1N4DVtdGEtPR
         nUEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CG49oeYgRKGkXZIpez+UfckpNF7tbwFkBXsCCjJfd80=;
        fh=0zVHGC//SC94CWFKHtFt4lnskmkXkJNNy7lE0FDd3Ck=;
        b=cxG2cAdhMvK0mqH6UHLwZNxDIHCDuGgHdVFF4lUWoSIIFGLTY7mmU4pIri8sG93zfS
         PcIrh1Jp6wvyoyspngltH2jfq0vkaAxcDZakwhbcaNyRo+Q6cVOCCALtHgJxIqGFBo8/
         Rxjcy5tv/tHnMZzYEP2T/5BcF1A2wJuPPnhCiXQzDdiwjGCNKgrbjiz/lTFIkC7fzHMV
         aXL0MdClJVP7//PczcFmXgcOKf9HSQdrDWq+MyeWS+mBJCBwPgZQI9FTyEsR/m0wyUxy
         plHeICrMdwhbq7BKfU7Yfy4wKBEVOZC6gC3dSQoBoAgobc2O8rd2Qpawn/Y0j4wAoWao
         lnKg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1789499087; x=1790103887; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CG49oeYgRKGkXZIpez+UfckpNF7tbwFkBXsCCjJfd80=;
        b=le1jTG6h5B4c/ONsqlIIa18VYTWie/QsWr7sHiJZGFyMJ6hqK+Obbca4jrY1ER+Cv6
         0qihMl7d7qUNqgk2LfaY9LB6lPnMv9uS6xnyZ1zzVegQnsPSkC+YU8Y6m6OX/nxKE5h6
         KY96rwzzVkouYNB6Y9qEwIxE9eVu1wPnZYUaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499087; x=1790103887;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CG49oeYgRKGkXZIpez+UfckpNF7tbwFkBXsCCjJfd80=;
        b=HLulXVX7cQ6paOSa57D5TehLtH13xpVIZ9JmjJHOi1AOHynXoq3JaIXI/qRp+RqMqA
         Naf+ZRFgKU3A66q8iNIS8jGcwJEYovbzoKSraS/GO5ggLLSeXAvZTbfeaP69PU7+Ym2m
         wnEinlNxCUlbNAE5pvG9flOLIS4yppsTpyXl/WG3Wp4yYMMZGyGPRLGs0sOhyP5+NlS1
         sC3ryVQ3k7jrr0dJZkJI29QN20ymz10G7eJPFCC8VB/f107Cu3V52tmuHeJOe8Ooxm7x
         IQpcKHdADTlRE2d3gC5U6kCxnoG5DeY76pXAYTNGyCMgDFzMPYWwF1XuXMi7wuxUZ1xn
         82uQ==
X-Gm-Message-State: AFuF++nsy6k9ZmkN7tqomFnaTkhHtRHPXLNXPFqJAop/SiDumE0PnFQk
	zS7WW7FvDks3M6dl59McnoJxvARNJrFGWr8qji/tbr8+1yT45VKnY37Nx4G5U0cmKj77Wszt8mg
	0S1Cnndl3XO4w/hs9y3nnRKnyztZgLO8YJ6knEkPFxtALINYpbabs2t5+QA==
X-Gm-Gg: AYBFou0kVH6dLp0bBzF9eDmDjVW/pWEzJNk2XCHBgMV/1L+DykRh0sLfBKbbpRT8F8l
	4M0Jxu7a6JebgEJ2POmXx+5+4/EMH8SIPkivC8VaRrV6pmqCajW8auLfqiWghK7bsUhQA3Vn/br
	lnLFeO2wpPT+jwcpZiJKNWZ0IqauVJaF86213C2jcRsjWmpgpLFFsOAgp9aeCeBsHJYVOHHE+Mi
	jvy4n1NoBIem1xZ1pRraPJgBFqEngmAZKkYr2RuqZnkzSsFQZpTG19CNuBgA1HR3+B47wFhnKAC
	W1y/HxqYZQSaUB5rTM0m3Kxtc9CobSu7YSOI9dvKT0sr1ZmosuAPReaRXfY9sCajhWsWCCHegxe
	Wxe48Fl0vvq0=
X-Received: by 2002:a17:907:1ca4:b0:c29:4204:8dbf with SMTP id
 a640c23a62f3a-c29d7733739mr190073166b.7.1789499086483; Tue, 15 Sep 2026
 12:04:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915-perf-symbol-memory-send-v1-0-1d3360e21f07@uber.com>
 <20260915-perf-symbol-memory-send-v1-1-1d3360e21f07@uber.com> <20260915185318.0573C1F00893@smtp.kernel.org>
In-Reply-To: <20260915185318.0573C1F00893@smtp.kernel.org>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Tue, 15 Sep 2026 12:04:27 -0700
X-Gm-Features: AcwNN1XVfMPCTdeeQv6DV6pTbf4aLmDnQHyCC4-DGkKjtADM5TgV5RXmKioy6qQ
Message-ID: <CA+w=M=Rpvn9QpbvC4UWex91wNZ39BNmjt2-PaACNS1Rsai3uGg@mail.gmail.com>
Subject: Re: [PATCH 1/4] perf symbols: Fix broken ELF_C_READ_MMAP fallback guard
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Could we restore a proper feature detection mechanism here rather than
> relying on an unconditional definition?

Thanks, this is a valid concern. I=E2=80=99ll restore the compile-time
feature-libelf-mmap probe removed by 22dd1ac91a77 and use it to select
between ELF_C_READ_MMAP and ELF_C_READ in v2.
