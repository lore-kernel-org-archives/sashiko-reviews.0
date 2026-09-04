Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0722381EA1
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 02:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788489683; cv=pass; b=amD8j7cjyhyZfX2jSPXeVRTlklN+RsNvENKsKCwTpwDXLvSC6T5Uw2Av8ICH92Ak+WbUnxdbLc9MDS2geAlMYX+4uBVTuLwsXUAe7el6AzjzqJr5b8os9pyqS3kiYVPjcsjBkmzs8ejyndQsHUfUblqHCyw+805vX1MtCXNnaEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788489683; c=relaxed/simple;
	bh=haeN8BwgCyC9B0Qb8uV/x9/S4ZiukBNTmmqvdkO4bN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=scaUyHO58acRXUrNIUCioZm7TsI5CmuJE3aCyayCtayzfnd34ex49j+CHZy3XLQ4RmCNaPqkeuaf+DyKdvWirra+i8wipN+vbyaijuhyv7HIaM7iaj2AbiXhrWo3X9T//3QsOKJQDjTP48X9D0q/0/se8EGNwKRZHY/Pm8Fdbpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=FUEhXRFH; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="FUEhXRFH"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c255acff671so75031866b.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 03 Sep 2026 19:41:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788489680; cv=none;
        d=google.com; s=arc-20260327;
        b=X90p6DFd2DZGtjAjiE0WZxahs3ZzeDU5VnXtbAWf7pgQYuNf9iMPbS2nKlxNjC0t+s
         d5AnOAdTy7hAIo614IHDxqtRWC7JGxxcZhA6uKohJXa/S5lNno9ZJl69jX6bQmAff9cZ
         FYzgZtghtsiWdhUcTMCl2Xemd+wgSI0jHGC/+7gykhCKDDg+UnFWsrsmOW1EjDV/ksd6
         KMUkL/HeMVSaPKAuLf2XBkkMD34LzwYCXia468X1FqUqVXideIU+Aq6kBSk5jcPR83Pd
         0LP0GmuQrZHRfJiHBcqNbBP38oUmxp94EPnm08iH2g8xhdWvMxLI3mvQhwUFApWJVI82
         y1Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=haeN8BwgCyC9B0Qb8uV/x9/S4ZiukBNTmmqvdkO4bN0=;
        fh=0hdvEPJRino8wRvGrrw1gATkOs6ExpSix2L2F38xNVA=;
        b=f3+0cbqmTz3tK1ZuENTFZ2HLBECbBJjHGNTP/DfWcI5SOiQcS/d+4BcVMvGpdVA/00
         eTP5j4S/7rmzfPf6NzmaBww0HLziPAZN4Hz6sSVVpr/4rIQhxx8h6Z3r3Ecy0h9zfRZ0
         YLKua7nNvracnjuKpbuwMo9SQ2nWP2noR1ZV+0K5dAa4g39sAQk1wwcP5T9KZzovhIcb
         6nbHsnZm34scjUP3Jx9eP1lTW73PoU5gA2LYxOHQ/xc0pjGTB7rwuHxybdU9tuaacGAa
         XiDIVpSvijY3buAetOA3gSeQ5RqHkQ3jvVY0AGHPG3iGJlQVSQ50fNPNNeQg73IfDAyH
         QBVw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1788489680; x=1789094480; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=haeN8BwgCyC9B0Qb8uV/x9/S4ZiukBNTmmqvdkO4bN0=;
        b=FUEhXRFHBoGa75LXuNi3IA8caid18HuCe674t1TI+BrQwsr68zTyj4lYeagitF7I2b
         qvb7EcUgpNKNJo8DmGE2vRMwV/ERTfzGcw4VTJHHdFhu0u9giN1sn/819r1jzYc8IV6/
         5+T4FNml07Iiy5typno2tIcSgymv/2riW+bI8FuSdjM1hx3YLP7DPD9HekiDCH9o2wmf
         gAixm3CbhU2fMmAVc9qM3dpJTQCkKyfxmruvAgc+upVlXChPR1rOUAV7XKmrKcgERkUZ
         fNU7cPKgBxoC36+Lzw0i4burRzmJVFiqNh4u7IXQzs7bE7yMAz3WlG5UUTuHDlOmFGvC
         znGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788489680; x=1789094480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=haeN8BwgCyC9B0Qb8uV/x9/S4ZiukBNTmmqvdkO4bN0=;
        b=MOd4H32rgbymN38MlhghhJNVfJL16Yw+Dd7YWavUI1yUnb7dL+SzmFj8phC372vjPb
         +8n0Fe+SpEP0I1AHvKUv2AGNEEeGAdweSIESofwYEK+RDMfB3i4OPJOIONR2m6eGlaCz
         URLN53+LPEmwKhGn4YKzHOem/ULP6QKLeB6/3o3Gt4uhNxzJHmw6keQhk8oswHq3biND
         SvjZfKLjdAxk6DpYEcFYynHR1zn5UQ2LCaWLFoLKce5P5DnCSbzm8z2w6MhCvlk1Xs89
         3clVxiA5NFBf+23Z82LCSfZh3WptFp/f9XzWuzitJMPZqhp8IdfDQ1I7QNzMRljt8VdU
         94SA==
X-Gm-Message-State: AFuF++mRsNtU/q/9NwDETDnLu3vevWaHHXTxoCUYpctOTtHsv5wVa+Ta
	Vk8fqjfrVaj7LNQTx6hXhzCqGqFToVaA/fHMwx/4B/s2/oL6zfXFGiMqHr9AtQQwf8SDFtXBvHr
	MGwJpcHD3eS7u3Ibt0pU9+rxhb/fy9j/QUph2BKhpEqWB5k108BmvBgpOSe91
X-Gm-Gg: AYBFou2D2rmMmeWnmm/ajXbwU0/kXmZdBjK9Nv5snonQ9xbzVtDvvgA/3GVU6OyDtsw
	s+e/V8Ho77ewaS+b3+YdVAHZ00v2rOV3Me3d0hjVi7IYAU7G4OHvtSKb6AH+ojgjyFcscboEkFr
	tsuNClbGXkbYtH87Na/r+GTLfev42mkCsLcioG6J40knRmj5WkGlwLhGAQYPPaS/tVnfQRrIGy6
	8bznwgBGHVCnB9zUk3KuOy9cbgEcrXKf34qPBIgTPqoCbFeL+2C50CIvF2j+lrIuL3ZOMUzVv7T
	fgBpnVZkGuHq1Z2Xv8GTUfV2uu3bq6O/+yGtk66PgzySDA==
X-Received: by 2002:a17:907:c1f:b0:c20:d90b:2cb1 with SMTP id
 a640c23a62f3a-c260c48eb7fmr151929166b.0.1788489679824; Thu, 03 Sep 2026
 19:41:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904022129.97896-1-renari@arimil.com> <20260904022129.97896-3-renari@arimil.com>
 <20260904023424.B3E601F000E9@smtp.kernel.org>
In-Reply-To: <20260904023424.B3E601F000E9@smtp.kernel.org>
From: Arimil <renari@arimil.com>
Date: Thu, 3 Sep 2026 22:41:08 -0400
X-Gm-Features: AcwNN1WjASArX-YhmXTGtQG-Eun6uq676mwBPhxrZKuoGIxqwl0m9gJaLnPlvvs
Message-ID: <CADBHdQ2g0uX3rrjdE8+BiO_2n5Ld2FOesgeowTzKunuAZhaLaA@mail.gmail.com>
Subject: Re: [PATCH 2/2] hwmon: (asus_rog_ryujin) Synchronize HID command and
 report handling
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 10:34=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The driver starts the hardware and registers hidraw before initi=
alizing the driver's spinlock and completions, leading to a potential NULL =
pointer dereference panic if a report arrives early.
> --

This is a false positive, this driver does not call
hid_device_io_start() so there will be no early reports.
