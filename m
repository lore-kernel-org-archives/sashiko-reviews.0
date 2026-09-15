Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A662BEFE8
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 11:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789471820; cv=pass; b=SxMdaar4E1s/FmjW4MhjdxmYNf3ZQwoZXXyJDYVheT+3rVqbbDwYXzHWNVJBpMY2KNy+zY2d426H0Q60ihUcpDX5k2ErWkgMvybTbgoLoZjcyPZIOVM8r+JJ2a73ty3yt7REJxs3XMk0k486+jjmjRbarEinHGip0X0qL+tzGkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789471820; c=relaxed/simple;
	bh=ctN51SscDl96yAfOoCtwrpkHTXHsrI3e9yoxIIut26E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H2W5desd2haAeCFj2fqcG7hH8WLidxgTgDXoKvQ0c2kR4Cr96xQhYiTyM6am5SWyEMfBVHSRE52lAkwfJY5hssP6czMSbBaXaMAtLjh4nq2yvA6xTJawzvw8LZ+ae8fTQCOi8NGbJmgaMWhzGeUCHeCZ6D15orT4njW3PtAbJ4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mEW30+Pn; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mEW30+Pn"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4cdc68c1so440728d50.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 04:30:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789471817; cv=none;
        d=google.com; s=arc-20260327;
        b=hOL5Dxy3t1WASACJZnaF8JlfMLUCphm24C2QHfiHNhZUL0VqySWS5XC7iQLwrE9UM3
         fYN62mG1m/4yeyPQwzxo/HAcFh8ytBm+JObONnSKCGjkqLVwt1HzAUwN5sfk18/n9r1C
         VPjHn7Zpu+uUOvEu3YIlAJoV+bQ3m9YrimvmOuR/3gJJbCQmUFlB6qnjouTMliy0cNcJ
         M8H6buVxVqISwOThagGjhL2LHGMQsxTMhKD5Zh2C9p3bDdSkCRPQ9puhHnPtWzr/qgCY
         xmvYfGz3isTH/Zel7vmKY5CnAYkKb2n6dStrar6QI2WFHqwGF3IayyBwoBanJIioOKQl
         2EIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ctN51SscDl96yAfOoCtwrpkHTXHsrI3e9yoxIIut26E=;
        fh=EY5TlApt/5aDuAGhN39Z+OkpdAe1Jb4FVHoWsSNUSfI=;
        b=HEB9GsFuYY+vnvKUYXqJ3DHE0d4AgvcxZLgpy2pOiaS5CFkhaooic3+y30m0AWoUPz
         suuO18Q1R00+mgy9/B0vOdn5F4ZAddrGFYaT3F8t9uYdSAy75PQ0dkY3x7DwtmczLZeB
         CPnRpfXppxmT8yH9oQvxvAA1so0tqHbKZSWn3Xk8g+p9WqEcxwgAZidGB5ACetsjzEYl
         JJLZ9Pyce9zc7umjyiJj1S/yAQLXat4JqvzAsoF43G7cGM7tiN+ViACVZr472ilDEY4J
         NSbbhbchep4LVRwBO8VqBgc45fPIhtyRmC/YsCD8nkGCdQP+mqOj844iw3uEztpr+Mvl
         ln9g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789471817; x=1790076617; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ctN51SscDl96yAfOoCtwrpkHTXHsrI3e9yoxIIut26E=;
        b=mEW30+Pne9P3m4c+tPDy2Xg5mfodJ48BRqpO84phdOYCzoU3YJQBkPjsAgwDv6+qxD
         VMyN2/zragZFJKVQgpBfZFyvFSJZ0fsMs2Ul2phh3G1yqtaypphUo4+DAjSfWl3M3I3B
         1hEe0t9aYbjZPA75McinIKDaPk16jRG+HdLwyYIk9VRFdAHKFBi9aAr2JHULElwog5Lm
         mE8bZaLQ5m61ro6ZoyjK2rHm0tmWVw+pNsYweFbwdpGPOwydXwJx75Q4Sc5eGDToInFm
         YmFHdgtQOUH8NdI9+VvnNGIOqEPPlL/cXQyHjamMH4NR5nnMKe8Lcs8AlyNtWOSo8AY0
         wk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789471817; x=1790076617;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ctN51SscDl96yAfOoCtwrpkHTXHsrI3e9yoxIIut26E=;
        b=shbxBUrb/dZTY0BdxEHLMR7TVIfIjzfpy/yr81O+lZmeB8c7RnWifvVqoPMb68KmNL
         0r6mftjOlkyn7xCu5gzzysB88tpYiUVQI8OMgef0I1uJEEgeUSzHAGbel/+NMDHROQaC
         /oyak03NEtbO6Si7Mut1M1eeCwx1XfpriLfgibFuLCsS4eXYPH5zO0WIvsXJeW6S9mb+
         bXJnYYVNhvBUVPuL9jXwhbyK+w5WY+Dofg37n7AJ9ae788Q8mn5CbKoVFzqm4wpJT+AZ
         jSI6Om2r+TWdgBjP5Da7NMuMTO/iBt+KwWsqBSKtQd2qUd3/zWGvHEokYmktCK9hTDFi
         wpaw==
X-Gm-Message-State: AFuF++m305CuAjUdrjosQtdhTqlWDXClseKsY7FkWi9SmS97mqmC6rac
	5bwgUj3DeoZA+nHHsUhvtOKUy2MVpKGSmcToy1hIHUj7ZPvHBcNjBdNKTyo6Q/KfVyX2y/8dGFU
	huqb9Yo8cP5EuFquikZm4wqle8+3LJhY=
X-Gm-Gg: AYBFou1djmudHDIX8nOok0R++7tkxYxXZnC8mIy1c276Dx6TrFXaPHWcJIHfA0xdSFI
	v6I2A/owXx4qxIyqMqOFhTc4+Jb5xA+yiOPmLOO32XjgkZthI6B6SzTdiCuvnSvi8wH9/dHhyy2
	04u0IQFGIH5FtCQsJILR+E+7nrZn5dMiYc2IX8+6hWgEJDyCsIpWFk6DDlEiX58IWHF1lb55QEk
	K4J9qNOkvzw80xMt66C54WA/VFSAfNjamPc5LIDo0whXiZRSrh4wChA3RRmlb9BIJJERfKVrFtl
	BkIv5XLPudibKkQcn2HpCUosSu3/0BPEkgw9v+/Jm4gC8cZzGwnChIyb
X-Received: by 2002:a05:690c:630e:b0:870:48aa:473e with SMTP id
 00721157ae682-88d19058869mr28240767b3.0.1789471816696; Tue, 15 Sep 2026
 04:30:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260910184452.895485-1-itai.handler@gmail.com>
 <20260910184452.895485-2-itai.handler@gmail.com> <20260910190139.BF6231F000FF@smtp.kernel.org>
 <CAFpOueRqaQ=C3u+br6AsCDPeeFwqVUmCG6JSCu90noowVCfd=Q@mail.gmail.com> <DLEWE24XEKNU.1Q1JD8PFVRJML@kernel.org>
In-Reply-To: <DLEWE24XEKNU.1Q1JD8PFVRJML@kernel.org>
From: Itai Handler <itai.handler@gmail.com>
Date: Tue, 15 Sep 2026 14:30:05 +0300
X-Gm-Features: AcwNN1XZV_KcXpgrsqVgDP23cMB0wTyq2Xl7FjPYm5C4oFYJ8HJyICxhmV6sUvM
Message-ID: <CAFpOueSTBSipye_1VmJBBJSXsn-KBYoKUL=JTA4Ker3nMhFPQQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: take the flash lock in spi_nor_shutdown()
To: Michael Walle <mwalle@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, pratyush@kernel.org, 
	linux-kernel@vger.kernel.org, takahiro.kuwano@infineon.com, richard@nod.at, 
	stable@vger.kernel.org, miquel.raynal@bootlin.com, 
	linux-mtd@lists.infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 11:31=E2=80=AFAM Michael Walle <mwalle@kernel.org> =
wrote:

> So is this now two AI agents chatting with each other?

A fair hit. I do use an assistant, and I should have said so up front
rather than leaving you to guess. Answering the bot on-list at that
length was a waste of your time as well; sorry for the noise.

>
> Sorry, but please be more precise and on point and drop that wall of
> text.
>
> And please annotate your commits with the Assisted-by: tag.

Understood, and both are addressed in v3: a single patch, a much
shorter commit message, and an Assisted-by: tag. I will not reply to
the bot again.

Thanks,
Itai
