Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F03A3BC667
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 09:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780045702; cv=pass; b=X1yJgy5YcnLH7ZJMeS/PKXhkyz7+yA6WR0sF+ulsip/KoM1O+BCdG9R8qXLtu1hyh3BavKaZ/rvI1L8lRLsFuXbl4yaONJ1fGfbfxoiBrtmxkq1oR7KWbIHkl5fOMZQ6qXKok5Id3RI+1hA8rblsz5zE3/CS7r2KGkdBkL/fNLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780045702; c=relaxed/simple;
	bh=Jtyy327MuOiiBAAUFhMnxBn/7M3zF2JyklBo8IFhomQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=exuPbPn3UDgN2sgLwMEYifG/QxwaVZFrHe1V1YsCCdrW2y4AhITUVUGHI9G8zLKTD3k6sJzADSo7pq0Hud+j3HZ9D2pyUrbWMsoOnBlhSuoCBMxafpkaDIBWh4pQSrbjXUsgNFHWU6lidgAk9421TPzspJ0T8GgLu/zMuEtsOpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PH5tzZ1T; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PH5tzZ1T"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7bde9d73678so143917007b3.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 02:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780045700; cv=none;
        d=google.com; s=arc-20240605;
        b=Y5SrDRLUvEO1f+LH83bdNCqepGLDW5JoUTW4E99zZpCFkNbNa9j4g67k5usBpdrQGa
         IlBdB62/1ns2S+8BHs7aX6FCgMf88ygLoEIwCAGRywlUrbfrLpUZIY+4XnDad5CyWJMi
         sOSBLcHqn+tRiF+0Q17UXKUM1WmlGXwqog2BOTEXF6wIlIxc/iQR+s5Muf+lBD1JATkl
         YYkxL99DjxQiBx5dme3KHY79pe3eTopTHYGU/UpQ3i+LVfLOz5OZqQugrSCfxr3E/qnV
         AxI34BV/3uws8OOlB6DiBzxoXAD5Ja2rnYhmso6xegMfe3NywtBM7+qk3iFa84lNVPyT
         +G4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jtyy327MuOiiBAAUFhMnxBn/7M3zF2JyklBo8IFhomQ=;
        fh=seZiLxWw5Duxn/nVZ1Pqv1j01Oj/QaPPA8dbLB2Kz6I=;
        b=CeqrDZYZZcKZExx7xw1BBrtakVs51oTl6+Ti0FS09OTM4i9UlyyZZr1TS58+wRTYKZ
         NdTuxjaJgDL9Y9goBDzd28PgCBBNOPxhZgXs8S/6Vp+8vOfFUzKp+jziz5ThUUEzxj6n
         sGl7FqBNaLfbZaHMo5jE+I1d8Z86YGfdtBToBjWLmiOTyWrMNARkjsobyj9ionJKGuNe
         07+0t2ODP4tK4cNt2+EXwAgn83x1Q4E+hNFMGIWaYXi/D99Vp5Cki9S3PYUcd79vyshc
         pzrbmHRqlXElPGHlnEs+DkMXP2Byy40mDNi/oLUMfTGDsh8DarGFR3XmWIIA23tO6o2x
         d95g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780045700; x=1780650500; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jtyy327MuOiiBAAUFhMnxBn/7M3zF2JyklBo8IFhomQ=;
        b=PH5tzZ1TK7fVISTvzLMTH13mniaE207FCXJcK84WbYI6Sk+YNuNZrNY392uiEEfPmK
         8XgAywCRW0NeeR2Lbu2xnJ7idXom8A16QKAvlVkxiMcJflak2NS0tZTkAfC+FXRYKTA9
         HvQ6wGa1uHi3bZapqaGcEeXtzBUGPk+z4iqVB8z0fNptO2SBzRTFC+M/fLJSG7ZbZZ2V
         pHyi7SnukcFIWybBBsNHY98WJaJ4JwezywNf+MdphvIg/POdQQiTRs8gaXuIy6ThYn92
         rXbgXinkFxeTHLP2/sNsrvwVfwTH3wReLsVivyLJT0C4EIn0V/NAVgNKUOmU2bnqZIPp
         okCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780045700; x=1780650500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jtyy327MuOiiBAAUFhMnxBn/7M3zF2JyklBo8IFhomQ=;
        b=Ai2i6rzKzVBUSag48EGllUpfpskRBDu5OaQ8ycFvIF6pevc7XIuFnLmsYGw+xqdhiy
         5xxUiHXcO9EIF7nI5SST5uX+dLeLq4VdQBuQCTB6ZqfRkmpfDK69wcONu30QdN6sNKbi
         SBVsCGP6IZR0W9vfKt43sOvuhS08EzRJTOLVp+faHAR/zldQ8UZVtni1H6suHK1Xu8QF
         liZmReTq19GuKf/2kCsWykzGMX/20kmiC7hNiDFf7nStjdo6RDR/b6JUBeRwmdVa3dbI
         6ZJOyMB9CdeY2MGlrckuqiEPm0y5lD9wB3+fTTGyiyVTuKdvmdLfcitikMO6HPovi3rv
         lm6g==
X-Gm-Message-State: AOJu0YxGSLcG+6WuUmvr4eWlf6UVOpHSb6x+V34+7CNp3hG9za367FhR
	o72M4lyjn503DEGhdgBcSIuLhsz4EkmVatZwnXMb1znIEH62PDaNuljplrfPgYWPhlu5VBnduRj
	F8hGE3kRSXrKXoKmwCLk4UJydb1JS1Em4zz+TQMIlrg==
X-Gm-Gg: Acq92OF8gjt47/MnrxddNuhRK8YKIQ7F2sUME5w5pOX1LL4bsXGfB01F4E9kYUedWAM
	v7l9N+9y1VhBgzRKYtS9HPhsQ7tnmhPEHbRcyCsa5R8upz5fPdm37utALgRmnV8CnLhagMvThez
	wcNlx5g7ruPOYHZlho32TmIF6krr6mVCZGVlXHrSwImbqqP0okFtPi0FnWzCRJv+tDMl4n2wD4l
	/lFt96eDNA+aYd6Xake9Yad4+FRrG2+PtfVrfDB51mGn9B5lOiL1AJU2E8lFUJmoUwjoAmDyAJC
	bL6rmgB4ybBq4PyvKdFqNaGv1rxvh43zO3xNNEEH8voPwC3IqlaEOq23Eolc
X-Received: by 2002:a05:690c:74ca:b0:7bb:ced:fef9 with SMTP id
 00721157ae682-7de30fe4528mr14967637b3.13.1780045700040; Fri, 29 May 2026
 02:08:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529034542.68766-2-laoar.shao@gmail.com> <20260529040130.95A9C1F00893@smtp.kernel.org>
In-Reply-To: <20260529040130.95A9C1F00893@smtp.kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 29 May 2026 17:07:43 +0800
X-Gm-Features: AVHnY4IO1MQr3CJ2f801kAPxEYuANbMO06IQrG_toAInYYDc0q5hFpleeSy2jgo
Message-ID: <CALOAHbABz7CCK4spQj4-ApKqJhPXOsWUiuX1fyrDWAyvEZFV2A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] livepatch: Make klp_find_func() non-static
To: sashiko-reviews@lists.linux.dev
Cc: jikos@kernel.org, joe.lawrence@redhat.com, song@kernel.org, mbenes@suse.cz, 
	jpoimboe@kernel.org, pmladek@suse.com, live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 12:01=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [Low] klp_find_func() is improperly exposed in the global public header=
, breaking encapsulation and introducing potential build/linkage errors.

I will update it.

>
> Pre-existing issues:
> - [High] klp_find_func() lacks input validation, exacerbating a pre-exist=
ing NULL pointer dereference vulnerability during livepatch loading.

Valid. will fix this issue.

--=20
Regards
Yafang
