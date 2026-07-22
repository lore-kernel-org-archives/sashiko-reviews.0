Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14F63BBFA7
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 15:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784734937; cv=pass; b=UWR3e6KUsVgC3u6HwA7uot2Myc+D65YV+CIbiZb6EAcr1VI4nQX/HJ9+a97HDYtT9bXLCeY5qMLgcmY/19qZouAaEsLr027rwAzYlAfAiuvMVV3+PSZXMJEkPb5PImUUkWSvfYfTVkOcohhWBGgJVZ65CzhonrsmgkTUlkXmGQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784734937; c=relaxed/simple;
	bh=W3qDeXLetR0TsLy6YU/1B34IhqeSacUbQ8FGxwJODhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aGyi9DHeBih9Hwo+ucVWP8P42hk/28QKInU+A6lsmnL7EP2mQuKrshBmFjxHSiyDThCLVlm1X3nIuKLAzNE6pLLus8H0Ap4UH7YVauX2/ehGMl6aYrd634YOBoT7srNTMfQ5kubDjgUdYBkSyNRxUJsXPYP/xSYATlEo2NM4VX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RmWsHBbS; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RmWsHBbS"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ca5b707b78aso2618a12.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 08:42:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784734934; cv=none;
        d=google.com; s=arc-20260327;
        b=Kh06jUnWk8d39bpRggrC915oYSqr3RtJu/cMuLByFIwLDQY+x6nCp47EMcUTQ82L9P
         cZlMWJm7wW/fxZ4j3LXqkOdu+d1jd1cBBLrgjuL994sB8X5PNg/tOAsP/a4EhMAVOruG
         unIA1rxXM6U+lldnMGrXoroAajZGp3sF9rXnrGyJDOuhlFAvml8WWu6LLEVSqefU3HV7
         JIwkt94R3rC/So91HIDrYGV6KRc/BTRF1wBN9VD04byEcoLywsekQ/3Q2jmkLHS9VZtg
         DETD6CfpDbqF43si6wkOsbYldsFKjQ1u0ZGMHDxoHAzWaxb9aAtdOAqKklewyj0z9YIF
         QlYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TTqYZMK9fGKKUMNkPtpKKlAD3TWJJcDsNL9MVJWEDng=;
        fh=Ettc2qbLYPMpwcD0FJIQVWtAzTC3Id5hSkhy+pcppEc=;
        b=Sw1ZoLhxl5HhenVPj8L5+B052fRNVT+5Kbs1rtCRPKR8XSdEQIEOQjsptvYLP39vJN
         HWsX09GjvjVOefBBRYcC899YWrtRltBbwQgeBipB8pd1nhOCrpwRpw2sgon2YxURbzE+
         RmOs54QYSwKEMZX0BEJjWnOoOhPeXwLej/1Rc6fiJ6xh2OzprIPOM7FLF3tGS64y7Bmg
         hus9RdcY4YKjUvg78y6/BXAT1t8Kpl90XzJSpLC24Vdbcc7QLKb8TGi3LPCmpMtJt/N/
         Q34DhucgfFKy7U4CkSKx4C80hTYxbLQ451vUAegDEGTryZ16EL5pim1Q26aK9X+aEThI
         rivg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784734934; x=1785339734; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TTqYZMK9fGKKUMNkPtpKKlAD3TWJJcDsNL9MVJWEDng=;
        b=RmWsHBbSclZysffIm8o0qv4PW3uJ1NP0r2q8cQhY5g1B7XOXj1dqd2e718ki9CWg/+
         Sqn836D3MvDnUIwd3kdloJ33hdxShSoFc/w3Cw+grOycH6H1uafTIR4kH3QkN71Jvp8w
         20QZDbOvyZn7JVdA/C06jzhFBn06qojb6h8F6qOrJOVrqVeareg34KieEod6ykY7lIq/
         6qsjZBXDC7pIOz1yrqR0DYIyi1DbDm2C2ASukreIq5NO6xbQTBygzfv8q5zsj/m2aa3e
         uf6bJOu0WV317tOpNi1tl5BYK/nzkoE1q78ufPmoaaPpx+lPts0OdQ37Eh+g38aUGaAO
         7CGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784734934; x=1785339734;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TTqYZMK9fGKKUMNkPtpKKlAD3TWJJcDsNL9MVJWEDng=;
        b=C0DPAbp4pPJVQY3tC1CM+ZGd0KMPVgm7P4memjsVIeWzy9LIwaapS3Icvu/L3s5TN9
         Cq+D0gdUDO8uFCkD3o/2kpJ+OgpkOtvXd4kYCjqWuRapR74ohtZ5i+F6qS8xF/kCTxm3
         7KepFdsfftfPxhONrTd3kRyBRDvqy0I5MffNTDVUSZU9PKGQpcKEm3GLgQTAr2AoGLy6
         kqjO4/OHV6fEK667ynBo0XZayzi+8zk00YZ76T6gX+WLnERl+viEsXEUrCZuY27inuGF
         4mk7vFqE8e4I8gvPMEdMvJH6u9CCcCg0D7GXqNpYNo9nevENdCSQ4sJ4I47L/ODQH0RS
         5BOQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYwNts/DwAYHm1m5hZGutTvyi/xcvLDvYVrGKa0gI3QBNP4+zXgfSM3n6+sA6t0hNLD2kun/FusZatPDsS4HE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwuNElh2cADyARlCuey42z8DJQ3SDpyheKoPsD7YELgJd5m9iTA
	xJ8hzN/MGmQw5IiP38wCh9FN/rc17kzOFDemWU1t0Mmxy8OotXt+RPhTBKel85blXCxtFiO+41I
	Yz9oT2lqR5hpEo8Idq0ju/0XxJ9eGgo0=
X-Gm-Gg: AR+sD11rMysmM3gclUFiuc3RgqGHcAjhecnNKU22M9J8wuDQRdws4PlL0+qIA+Ul4P5
	9dBFdGkAgxiJZ4cUpp1j8ROFK4XZ/Dxor/MsD1/ni/qoffWvVPdyA8EGiP/zQ4rXyqJfnzVMn0e
	3J7yeRmdYwEjtc3mfOjWe78r5hCKQPiVjhJI7/gi6GwKu/svO+67hjoZNgDMyp5hNxSCg9wTx1z
	77Zcea82YOT811Rr1G6PuY3VcrH8JDfdFqE6r4nmwPcr6MgByCGEAFgV1xPyLoFcSYGH45ueaVd
	6uNXlm+8Ae4YbS4m9MD1c+NjFRnzjcRrvGnQDNgSR4+Tex4hFBcuJU9Q3yUTiiOyRvtfAW03SPe
	MhQ==
X-Received: by 2002:a17:903:324d:b0:2ca:ecf6:9115 with SMTP id
 d9443c01a7336-2cf802b7fcamr62975835ad.2.1784734933954; Wed, 22 Jul 2026
 08:42:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260722041257.1557-1-pengpeng@iscas.ac.cn> <20260722042744.5C1B01F000E9@smtp.kernel.org>
 <dcadf40a07a616de931c484bbe68f4b3f1f83b80.camel@HansenPartnership.com>
 <2026072224-moisture-gonad-409f@gregkh> <f2eb5423-b5e8-4b8a-9d28-974dc0eef892@roeck-us.net>
 <8cb7a4a8a13bb003daa1d1413517e104955772d3.camel@HansenPartnership.com>
In-Reply-To: <8cb7a4a8a13bb003daa1d1413517e104955772d3.camel@HansenPartnership.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 22 Jul 2026 17:41:58 +0200
X-Gm-Features: AUfX_mxNJUq41Ky7nzLh3VQVuQID0gIoN9NG7LbJh_SeLBjqg6uwGAOlwPy3vjM
Message-ID: <CANiq72mwwG6M1=d-UW8CU=R+PoNzZii_mxZ_5=k5NehGP87mzQ@mail.gmail.com>
Subject: Re: How to fix problems with the sashiko review model
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Greg KH <gregkh@linuxfoundation.org>, 
	sashiko-reviews@lists.linux.dev, Chris Mason <clm@fb.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, linux-scsi@vger.kernel.org, 
	ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 5:29=E2=80=AFPM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> OK, now I'm confused.  I thought
>
> https://github.com/masoncl/review-prompts
>
> was the source of truth for this, but that project seems to have been
> copied into sashiko rather than pulled in as a module.  If you want to
> improve the review prompts do you now have to submit to both (which is
> getting to be a bit wasteful)?

As far as I understand Mason's is being pulled from Sashiko's, so we
submitted to Mason too.

Maybe they also sync the other way around?

Cheers,
Miguel
