Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E7A3E5A05
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 21:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335236; cv=pass; b=baaxMRv8KiJ1PtciKFEM+qEMkUKKyrEe5M5iucxYbJfTPdvJROqwuc67rYCQKYwo8E0tuu6qV+MBp+dhK7U5+2nIWO3A0COTl79e8GqMTkRrTUao4OLs5vCdIHhl1VB1W8YEpOUgM2qio0ZXFethd2tn+8xggBfHknE7mVmVwcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335236; c=relaxed/simple;
	bh=41gHxPt7HUxFBkNkDE3LM0TVD4IOiCpFU2mOz/M/aAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ee7vO9mNR2prkD87egeQTNrnghDiVLQ/DMrq+qkqS8UDXKhObrC1HcGSDPLzrCrjqEMmLfZDaWKl3vCv0794dl/dVhW2XR1XD7VZksnNfeW9+4oE+chfRRwBDuIG6/k3QPvlm8X+MN/FP7ahmMAdquzPPqnBVFpKKnSS6wSWmrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=My810cEE; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="My810cEE"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-806449d108aso20375567b3.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 14:07:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782335234; cv=none;
        d=google.com; s=arc-20240605;
        b=ijNz/t6JARw+OeMBE6gZ/Z2AJ2xvLrVrsVpHOh/6+DUUm9LAF2xH14KKq4u1KPtrVQ
         ENaxHCrvRlRxiCBG3kex96ahSoTVDpozqwzx+cgpWiBYLIcn2Ql0tCJJR+e/GbuQF16i
         14QPwVf6bNzweB9gaOVsDm+890K66Ob1t0HuxUujGZ3s5eo0wx4T0BRrZGNs4sCbjyyh
         KMZXG+iVjk7DQhDw8tUI5TFa/Fu+Eial3SMTHUSMRbOkZ/JS/+XYcelxSQtW2WrBNLG8
         nfBdni64Ii276/0DyMZxwHDYqz0SuSvI/4zsM96NsTh6lrnvOIYUyfgrkt6QObiWSx1k
         XFag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=41gHxPt7HUxFBkNkDE3LM0TVD4IOiCpFU2mOz/M/aAM=;
        fh=9+UbgyY1ZWC2J7dzZW8G17BO0JbabJj9TMd/QWMVoDQ=;
        b=Rhq/k8ojOLcILWVze0xtazzUpttdPtP7DlsQct4oMuefKSgMJBhiwAyqRqZLlCkDmP
         FWwbMt0KDvC5wqRtirEAIoCGnA1g7aCJTNTc4rZVQ4azUW+WSjiKPsthB7b/QF/EqOm/
         aAnawdAc1OaKydXYzlD87rUTWPsEdgT7+o7Tem3spy8kKWCNRxjFhVTicvAJsL9JKMIK
         znJJd/PWqds8HYjJVj3yu4HisM+QCC2RdYw4Qir/jJLPgE1MT5UVV6E4pAV8HUGxotsd
         ALXy269pCTA/9JTJNZD1iicKmqsJdgHFAxqb8HMOOh6qdVQuOYYvr3uwoIOsiUYchvO9
         0ltQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782335234; x=1782940034; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41gHxPt7HUxFBkNkDE3LM0TVD4IOiCpFU2mOz/M/aAM=;
        b=My810cEEhyzjbjQaUw+rt7I6Hr4m55HKX2WoyNMKm0lKrzT0RQAnuMdq8ozb833DL5
         s1OpX3rFWF6WROQBVtWCxz8Fo+wKjkGuL3sIbOAWo713Yrei2eTtEmS63YIVSC8923tW
         702+/VA3dRt9EmtrvXW8b+DzdjtDyfnrShlXFHMzKB2uuh6c/BirKK4t3tDstdUX+muU
         glv+3VlIz9kTDZaVcrOIVkGkXFjcoJgwmAJuMNH9TTtxVCpd8GNeod5Wi/V3nxzpg+Hp
         Emip/IjZa6GsEt549VZ67pFQbOR8ADDWdETK9Bq5HJ6xGftCkrsIVjYhJS7yg+/CbljF
         9WzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782335234; x=1782940034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=41gHxPt7HUxFBkNkDE3LM0TVD4IOiCpFU2mOz/M/aAM=;
        b=LPZUWtpYJ00hx0MF3WKsoSLZmVeXS0Pj4Sxk0fcKpPUj8CrxZfTnkVaNVuztRp1oQZ
         pMVql2RJDN6qjEYdtja40mD+KETxl+qTuEDr9BUcPgBD8AUdEX9CTbndbFupos1r50yx
         E4KkaPiSipawES/8ma5bmOS+iDJunSYVee9RLiaZN4QUCkGAWoi4JB2dtExSzDWtDMTv
         2oJBInCohOGw2VxcQGJxMKwB1IBJWoqweSL9Q3s46OLbxtUZMmRHjNK3KLL9hySwE40I
         JkvAoT7hUKgM5+hXpn3VOSGILt+5ahn3T5bRazy5zGe7qmVYz8RIcW/bExvvQdBMPMOm
         cgzg==
X-Gm-Message-State: AOJu0YxM9GRRwz3Ovi8mUzP4BtHNANUMRemlUAskLHJrjOjUiFVPP3nX
	MKE1GzUwBW/djO2/hxSTtJdSshtmpOUObNDl2+L3vmHNRc2h14VcgR6i9J5PS/KmqBNQ+HcSfeQ
	egBwbDd/ruiV+2Lkp0nBGk0IrsRlcG8A=
X-Gm-Gg: AfdE7ck2bpnEYGpXQLEuPPAJQzQyYuaRAD8cJLZNA6UEYyKoEAaTjblWImu4EIz0Fnw
	PAfcx+eC1DyYF1oymRKcN7Acwn/DxRgXBWTDRZ0WlPrkj8SM9+Jxa6mQH6Gsw3ppk+InINTVLi6
	Fbf+ISZdeq8Xbx63UNovah/xnu5yrLGnZnoyMshs2g9ruN5IFu99PchQxQ7KtuC6KRdkahF8Y/O
	guHaUSxyJ263K9NoaVoSiJp3upy0whPjjWqZRGpwh2wLh/pqdnX+M8I6pTA+vpD5LeNmFQZeUww
	VquO8FnYJdiV8EIVi6bKTwDyihpfq7/XH7q7K/wE0inMs+yABei5aNhUF3o=
X-Received: by 2002:a05:690c:e3eb:b0:7b2:bf20:cdc3 with SMTP id
 00721157ae682-807eeb6f49dmr52477487b3.0.1782335233754; Wed, 24 Jun 2026
 14:07:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260625-bpf-htab-task-work-uaf-v1-1-31e711ccb159@cherr.cc>
 <20260624193149.3EE921F000E9@smtp.kernel.org> <ajxEE59cuz9XUWMV@pve.cherr>
In-Reply-To: <ajxEE59cuz9XUWMV@pve.cherr>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 24 Jun 2026 14:07:00 -0700
X-Gm-Features: AVVi8CdU58htoB5Js73L8sSmYdKMl6WQEpVsEYhmQ9JMyh58gXCYVNgBn07RzCk
Message-ID: <CAADnVQJeMsZWpJavHz-X0h3VKEMRN-xhHy-wpOOqFB3dA=pfDA@mail.gmail.com>
Subject: Re: [PATCH] bpf: Fix use-after-free in htab elem with bpf_task_work
To: Shengzhuo Wei <me@cherr.cc>
Cc: sashiko-reviews@lists.linux.dev, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 1:55=E2=80=AFPM Shengzhuo Wei <me@cherr.cc> wrote:
>
> On 2026-06-24 19:31, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 5 potential is=
sue(s) to consider:
> >
> > New issues:
> > - [Critical] Unconditional call to `check_and_init_map_value` on inline=
 element memory causes out-of-bounds writes for per-CPU maps.
> > - [High] Dynamic memory allocation (`kmalloc(GFP_ATOMIC)`) in the eleme=
nt free path breaks NMI safety and causes memory exhaustion.
> > - [High] Permanent bricking of `BPF_TASK_WORK` fields during in-place m=
ap updates.
> >
> Will try to fix in v2

Do not. There is nothing to fix in the first place.

pw-bot: cr
