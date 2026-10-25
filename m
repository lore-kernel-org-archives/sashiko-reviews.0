Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792905887;
	b=C/Me5sBplvXzDASNVdTh3o69xtFq8wCHq7KNSS7Tyo9AcNgxcWN7Ba7byHMDIKCgQx77
	 pk01EZZSSISTlcak82LoS3dHvoOaId0ViUbfEhnbIOWuSkEHwCAsqAXWhb0izWHmdFTs+
	 h0eQ8yDSTR9abWoKik0Bekm3syjUWRceBRMC8JQ/aXmTAKIrIXFVCG/9tl7/t8/EUbJkT
	 OoI4ceBmWcJtGuxpHZjPhp59OguiaWMzwMFpONMc6PtK6ahpuYpb0BegEO2HlypzqIQea
	 IHxYwiP+mKPYKTlr3i4fes7m/k2ZSFdoY9pwevh7AjNknmQjIVmzBp09ys66PPYxc1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792905887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JmvqmuS3RCRgSY960jsRVEbpfVE9FxMYov5P7FF7wYA=;
	b=V8hnL8qFEObTDEB8ZFYh8i6d96wbf78W3/2Q7KnbLvz9XYZ/D8g9CnD7M9TTDOnP0kjW
	 W7u7Yo+cJ3WWWdPLvNyaPgLsGmp1DMLyaOdRnuz/bkQN6qqnhQAON9fiZKzolHbQHf/5g
	 dHP1zd0KKMvP/e/kJHyM365dsWDWlZKYu3IOPMTpWRU4cv15DMU7VG1FBWO7tR2BjzxgQ
	 pRT7CMSXHWur5DtPXxco2ZE7+aBA4yi+s7EYw26oD9vJrCjHLrW+WxDWMfJ2hHaQRims9
	 6yyVZVzbRDPQO06PAqM9UTptB/61TH0rpVLsJWC8fdf+RCpMpolr/LE3UtavwpCY6sA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZkWKZavd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A643C606A31A
	for <sashiko-reviews@lists.linux.dev>; Sun, 25 Oct 2026 05:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A643C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZkWKZavd
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e5fb79ce82so13072025ad.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 24 Oct 2026 22:24:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792905886; cv=none;
        d=google.com; s=arc-20260327;
        b=TZxr3W/3VPu4nbHONlLw9+COHoOYj7atR5tbAe4K7Aj1E1lJCU6Zhh+lknR+gE1jof
         44CkK4TQwZoFwrdYkeSGc8l6mFd+1IFTmO/sTQiMZi8/1IR0nvnIJY3m+gTw3oWlTy7V
         vwVniLP0iHDdpKkeRKN9NPu/eEqxW0tXalnOAi7uPihKXHKDTdMear81rNwVCuTWyeEm
         eAtDHJLFs8ntTIZqvkMSxCXoJiD5Ax/YdgwLm4cg8q23lM4omOSQT6pfeqxU1pnylHrg
         oGcndslVepRcxgrmBWwPnrmFQ+LeTNKX003rnweA6JIaO/yXsihIPPY68wsHpzUrDknn
         Hkyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JmvqmuS3RCRgSY960jsRVEbpfVE9FxMYov5P7FF7wYA=;
        fh=oG50m+nNwuAf5R3cc4N1ynkJiUYGKlQOJgeKTEjHmJY=;
        b=Ygu4kokdlKAIcnZOnLjem7Ot2HsxA+IZuYhBZIo4OoWxbSNIY9keAZWOnbDAkhJEPd
         uvQJ625FoeYjCzodkHImz1l3GEpKBXAIOar51eykHRA+HmDbk0Uyb5DyK2x1eZhUGDQn
         ZzuXc1uQGZulDP1QEI2AYaT7Twd/FYv9X9o7+j4aDZoBm4OxP/MoIPXFEwnMrc3CblZr
         HCsXr7GCH179ydkjrBeoOlRyVtSPL1JaQxq5mbmzerI8LNF8caoNHENF026KsNMxXpIH
         yuMkaPfuKkdJrrT4PEYf5uJTX7HSTeXL0UhsWTfAX90b9fJTyoOl8eee6rHY9wkfAFI7
         s+tw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792905886; x=1793510686; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JmvqmuS3RCRgSY960jsRVEbpfVE9FxMYov5P7FF7wYA=;
        b=ZkWKZavd2jhfyIbRLOHK659n8Vl0ARG0l2TImRI/X7pCs6OOVTZ24nLUTVcNjtp4mH
         SXT0JNMZYHuC9pidWL7NGuhVEnevSu+uSqfXNqF3mbCu2LLJX66UkbVCkglv/h7wmETe
         7uzN/IyPgupOuzen8BVKs12X/WU0TKjWGAGELOVIGEAt11z8TheOg8lZqAFLSd+yNcTH
         7F2XbMRjbSndyXkm+eniCXcrVIpwI9ZnybyiQlJO6DovcUuUJ0v8Y0sggIDb4iZ+w8aC
         JzfmTWyFvhfkYfUW9Skj9wPvcrXpjOn7ROC/DrYhmz3mOTO7jPpsZDUbZYB33j/rKj7K
         dz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792905886; x=1793510686;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JmvqmuS3RCRgSY960jsRVEbpfVE9FxMYov5P7FF7wYA=;
        b=nxGHrrFdSemzZQ55Ye6jUBBHR8wT5b/HBXWj7qrHYwrBxtjUBLKwinA46382nr9O3s
         eQJN+V4wxwaZPlT+JAEn8BHxvyQ+O0R5Xtin/zAkKJIJJ+dVksmK1NNnwvIofO21N8TQ
         HShWbO3OpBEtouJZT4Y/c8mO4w5ziCahvFttdzK+ZuvWIEdRRC3aFnw6zBikmOJ6Tu6Z
         HMjnijIXykX1jhNKBkxNt3W4jBE0foDAXL5k2g2N2fsmItcTBvx/f4C9sAwmXSz/BAt/
         VXKLGqYvsJqtCALzTqYmvhwbjMUQQv0grCcgxB3J//KjMroJZTBBU2nA96PDwBkrEu5c
         WhnA==
X-Forwarded-Encrypted: i=1; AKwUvByWK2ys3WfGmefZYZNZ+G5wluU9mb5VYf1m7CQbM1Ns9lS27JCyrgoozfS3uk+U4xLuNjZfIiwP3OWUObXTyAw=@lists.linux.dev
X-Gm-Message-State: AFq9FYIoIo9SrA7SXGwSJeVsP83iqYSESk3uFFyAojkoRfwO3VctXDfN
	TrDrrcHf1ChWq/fPtH5wqcZTO21jtCxfeGSeFqIeY4rRG5hGZTKaZUFedAIQ8Pz8WxVuarJC+jf
	umLGHf/IQNn3l+s11swISW6IM55Pgjwo=
X-Gm-Gg: AYBFou1FXAL2xuA0Fok7OefT2l5Sb1jgqIxgDb9jTE5chMBF2K/4S2ajAUI/+bktryW
	W1KIIzYD9hA7q3MmLG3iXwZ6tFXsXMSQsVyoZJqDzcfzydHdGD8DvLk8Jljwrsy8gcgbKGvhkI2
	Yvt1jSRknTh34egZF4V5hpy7r0TshDwSy3TA7Umo0L8SxmKfjb+lbd7eHyiHp2JeLMXl+US12j/
	0LR6cZZueuUORvBhtkZlmLMdUjmPPGlxeeLq2zGWY0qwoMRRXJZQ1qqKSQtZ2qhVoI4ZYkBazWx
	Z07g0Mc6sq3mln+PdEMqDm/Nn2nfkuQ9017rQubCT3c5QHRvel4QCuzieMR1blRUMI2fTdbw6gs
	ZOCW3w1cVlgrNeZReDoecB7I5gYfmiC25RGmuSa6r8finnOcXmx0eCsLY1UpnOmybo90TC5pD/j
	muRcErxp8LeBSR0F5SYPXcKOcrzluqBnPvalxASptzn81Whf5WfkpShrY=
X-Received: by 2002:a05:6a21:200a:b0:3de:7854:8549 with SMTP id
 adf61e73a8af0-3e7bfa32cf0mr2230656637.22.1792905885861; Sat, 24 Oct 2026
 22:24:45 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <sashiko-outbox-182361@kernel.org> <20261023073359.642990-1-yangfeng59949@163.com>
In-Reply-To: <20261023073359.642990-1-yangfeng59949@163.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sat, 24 Oct 2026 22:24:34 -0700
X-Gm-Features: AclHuK8D9FBqPFBi3PBiJgDdszVKktCBL1MTcZWmWKw0faNK82LJi68mzP3chsU
Message-ID: <CAADnVQKUu+xTzLYOby49UGX8+CnenxTGhxL4_Cr2rJrUWao5nA@mail.gmail.com>
Subject: Re: [PATCH bpf-next] bpf: Fix out-of-bounds btf->types write for
 split BTF
To: Feng Yang <yangfeng59949@163.com>
Cc: sashiko <sashiko-bot@kernel.org>, bpf <bpf@vger.kernel.org>, 
	sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 12:38=E2=80=AFAM Feng Yang <yangfeng59949@163.com> =
wrote:
>
> On Fri, 23 Oct 2026 06:46:07 +0000 sashiko-bot@kernel.org wroted:
>
> > [...]
> > Should btf_check_all_metas() check and propagate the error returned by
> > btf_add_type()?
>
> The previous patch at https://lore.kernel.org/all/20261022064727.747304-1=
-yangfeng59949@163.com/
> has fixed this issue.

Pls respin targeting bpf tree.
