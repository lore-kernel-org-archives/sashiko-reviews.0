Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D7234752F
	for <sashiko-reviews@lists.linux.dev>; Sun,  9 Aug 2026 22:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786313022; cv=pass; b=piRReDOeiGJgmNZJo7W3r2CjJR3uW1UfnSrC+v9/0z1hnhJwSmk2Qk2FtgLvvdVBKrejlnpM8hsucxKuJ2sRL62sNbxzXZzvWtzX2SSuCHqJzLZRQk8aGvT3dmxwfMitwL7Usjb5KJTpwdmT8onkCd8xyfjXXgw+mSjD3RbM760=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786313022; c=relaxed/simple;
	bh=CPHfGfkaCSGgjaBSKrUW4qz8yrb9iYWrMlzI0Ob64gU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ie/zX4eGdNsr3QNlU7sZE9a5BqWqCSBHFO01f9me31UiIyeD2tlGl8jqT3e9gAIr9daJ/XggrMGJfZqH8Oqx0NAX33BwKfOTJQojnCvf+opqU7Y3M4LhDE9vbgN7vfHbG5HuJgophtSmzyru54uSXWdKtaTf0eggFtxZP/ngvu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=nuZD/rZm; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="nuZD/rZm"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2020421077so181741266b.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 09 Aug 2026 15:03:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786313019; cv=none;
        d=google.com; s=arc-20260327;
        b=EtBD829U30A/FSo87Wlw9sZ/tYwkMGRC12eWJQPNxCl2DvGwnCLWrgCNZEPQfkJJGJ
         1ugTStpFGl8ZwOOD56RJWN0r5yUzF78VcyLWGSUfMzJMdBFkz/V2PNhG+ssZBMWWkIob
         muKIyeW9toAvyrVQdrZaqqBM1JjhNe8b9ORuS2BQf+AyC2BNXO8Pl4Zj59ljL8fyXCXZ
         oYv6CENJHkzXbP3oOHwMiRPL1vYHhYh1Z5yVTCoGKNbqIRCeaz0AluPEBpwanIdwxU/O
         cpULakCwQPFVKlQJd3THvrp85Va0IaPXYIM2xp9O9AMSIfZAfZwCCPojhrdswNNTrO5F
         sfUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GJZgdGodB9xpTx/XpDx/EqQapI+4V0XVrr+TtqnTcGs=;
        fh=r5URhQl6whOcnDbP2Lcwh2ZUr6KpnezK+hz/MEOF1jk=;
        b=g8EVyCMBZPgb1sC6CJPvxXY/323fyx3cFKUGw9xgYV2ixcg6ZfhmtVM833fEZeJeoD
         GqhZJa1olF8460Vgv+nkNKOrbhG9ekD5tTqQzotaV0A0wu3JHpr0RPwiEKfFd/xzGxdO
         BvuL3IXrM6U+YaqRv3gYye+ptj3BQrMcw5xEHx9CTwnUbMLWSoSPOoxh0SKOgKsA514D
         DCqQhAKGXh0L9YdUyMC3TxHZc5BnXMEu59xvfjzk37V+KaFFHHeuT3hlyekgSlpyCjLQ
         Ek5XLxuXfil69xkwCU4pmxRND7CCAxIyUUx1jclt4q3xTdcKRMcHOaSivaTtOxu/DPqG
         uXzQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1786313019; x=1786917819; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GJZgdGodB9xpTx/XpDx/EqQapI+4V0XVrr+TtqnTcGs=;
        b=nuZD/rZmTLWNMai1luX5T4Di3n/4KIK1wj8KZK2Q8TYuDVMaUZ//hfq2oOG9j6JBeZ
         liHN2QHxcCYZIMOVl/euoQWUbd4ZrNQRkvuyNCmzOyl1up42uRwbAHrseFZS2j9q3uLU
         +I/PkFBkRtZZ9QqWcsQ+rBnjuUtmyWJrfv54rIWcS4ZxbxGQ8ECLyR+x0jrlP6DKR9vh
         EnFQTGP+dxJ49slZQWsiqQEmpLfEfQNxAW1vApd1P3kj7v+cLVFKa2QBfC4pAahdVJmZ
         h+tDjt7131jTrrB0CWrlqnxgD9QqB/boUeSyU1ZAU+tgiyVfc7uh98qha8f5ex5O/MvW
         w0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786313019; x=1786917819;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GJZgdGodB9xpTx/XpDx/EqQapI+4V0XVrr+TtqnTcGs=;
        b=StIiu7EOUMr4ovE4ggCGlcuUc2bVMOW5mO2TI/NsMaL7YrMd8EkJQrdckUXEVu5LuA
         C1JJtYQSag2L/JK7XvuY8jLGK885WdQbyxLlcn6JpbFuRcvsy21yN6aa2g0SiP6sXonQ
         5mg/X5Lq/rtm7vIjbW2sUATcBXW2U7Su26ejuTbW87T3KKk0TjdTsItYyfGpjcBD9VV3
         bFV8KV1wxv8pOB5bctdrY7fawrbR/9cRSk5lBDx18mRlK+g+8/LhHeV+QeNDhLqOQCAa
         DIrrHnrIe6U/IxL3Vp9hdCYgftVrmXUhjE1B677yp/Zr+MUakqeiYf7mDzlizEZ26G01
         4NJA==
X-Gm-Message-State: AOJu0Ywe84umago4VjWOwR93oZiuBlHfK39zf2QemCTi7Ja1xWgS5JbF
	T0ot3RPJ1pHxTlDtPqEpWoP56Jr39w1v8B201+bTnPU+SGXqFaIH6ggcr7nll241sBfgXXBDZ85
	ycJHZkjWX92Jhxp797e6DTSP8VqiAi3LFk6RvQ3bsMQ==
X-Gm-Gg: AR+sD13fznHMnigjmZlquTx1ZbTRaRXqLvip0tck+g/rspNtksVvxWzTuFdSMdiHPzj
	DcW0I23zn13rQ40mNllNJzON0eMb8OII+UU3K0F5ybKFmZFSZla1N2UaK5qFi5m4D5VWv8i1hds
	KSPoFQpqVAZeZ/OS1sed7XQmU0uo8eb75oSc+pETOUeiE5sggbt9FAGQFW83IWbJSUteJ8AkRs3
	kBmfpgacvPVLNFF+TQ4DuYcqR3xy1Eo0oojdqYLe7hwWrSJCBYUPjWE/N+oRoZZpFXDQnsgiGNe
	XB+1DMUKEv3ZANCrbp3FDyJqj/6jtdDS8HNGuo/w9kShOQ==
X-Received: by 2002:a17:907:d20:b0:c1c:257e:4888 with SMTP id
 a640c23a62f3a-c2039cc4dc5mr2009459366b.27.1786313018849; Sun, 09 Aug 2026
 15:03:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260807000107.1786892-1-renari@arimil.com> <20260807000107.1786892-2-renari@arimil.com>
 <20260807001412.B61901F000E9@smtp.kernel.org> <5a817284-a9f4-48b2-9f0f-802c5dc6963c@roeck-us.net>
 <CADBHdQ3x4bFe518q2PjZvGJ2=qP45+5Cmm8f99J9gRZCJun0aQ@mail.gmail.com> <d7bdb634-6fce-4bfe-a24f-864d20e46d92@roeck-us.net>
In-Reply-To: <d7bdb634-6fce-4bfe-a24f-864d20e46d92@roeck-us.net>
From: Arimil <renari@arimil.com>
Date: Sun, 9 Aug 2026 18:03:28 -0400
X-Gm-Features: AUfX_mxR7CoQHsKtaqBhqcgOuh5IFOP1HuL442019kU021M_VbRDi23KORuklwM
Message-ID: <CADBHdQ3LhfunbnwCE2AYmWr5XwqSvJ8WGkQFW1G=GQv4dp=Ndw@mail.gmail.com>
Subject: Re: [PATCH 1/3] hwmon: (asus_rog_ryujin) Add per-device configuration
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko-reviews@lists.linux.dev, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The github mirror that hosts the same code here:
https://github.com/aleksamagicka/asus_rog_ryujin-hwmon

On Sun, Aug 9, 2026 at 5:23=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 8/9/26 13:23, Arimil wrote:
> > Sounds good, I'm very inexperienced with the kernel workflow (I didn't =
even know you could e-mail patches directly from git). All of the ids passe=
d into this should have that data, but a sanity check for an invalid id def=
initely can't hurt. I'll make a new series and open a PR to the drivers git=
hub repo with this change sometime this week.
> >
>
> What github repo ? The Linux kernel is not hosted at github.
> It is hosted at git.kernel.org.
>
> The workflow is described in Documentation/process/submitting-patches.rst
> I would suggest to look it up.
>
> Thanks,
> Guenter
>
> > On Sun, Aug 9, 2026 at 12:37=E2=80=AFPM Guenter Roeck <linux@roeck-us.n=
et <mailto:linux@roeck-us.net>> wrote:
> >
> >     On 8/6/26 17:14, sashiko-bot@kernel.org <mailto:sashiko-bot@kernel.=
org> wrote:
> >      > Thank you for your contribution! Sashiko AI review found 5 poten=
tial issue(s) to consider:
> >      >
> >      > New issues:
> >      > - [High] Dynamic sysfs IDs (new_id) binding will cause a NULL po=
inter dereference because `id->driver_data` is unchecked.
> >      >
> >
> >     Looking at other drivers, this seems to be real. See wacom_probe().
> >     Please add that check.
> >
> >      > Pre-existing issues:
> >      > - [High] Missing bounds check on HID report size before accessin=
g payload offsets in `rog_ryujin_raw_event`, leading to an out-of-bounds re=
ad and information leak.
> >      > - [High] The `status_report_request_lock` fails to protect `rein=
it_completion()` from concurrent `complete_all()` calls in `rog_ryujin_raw_=
event`.
> >      > - [High] The device is exposed to HID raw events before its comp=
letions and locks are initialized, risking a NULL pointer dereference and k=
ernel crash.
> >      > - [High] The driver allocates a DMA buffer using `devm_kzalloc()=
`, which breaks cacheline alignment and causes memory corruption on non-coh=
erent DMA architectures.
> >      > --
> >      >
> >
> >     No need to fix as part of this series, though of course patches wou=
ld be appreciated.
> >
> >     Thanks,
> >     Guenter
> >
>
