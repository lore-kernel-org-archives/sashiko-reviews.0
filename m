Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B480D3BBA0D
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 09:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780045910; cv=pass; b=dx1eurqeL6lgPpnFbbWajLMDs+MwKlLr6arrAUta8ELY8Ie7MyPrAGSELeXLicoTNLjSdQuY7h1y6a3LF/WllT/vScqzYFkkhqzD0LjQxPTb7x8evl5uFI5fDEn0BKPptrWaE8KdPdb3KCISx0TqOFYVoqpD7q6WJ92dSpAwIUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780045910; c=relaxed/simple;
	bh=CQeCxWPRmFsxaf0wskbw+Y2MvOe3sA3UOSGwrmYqRys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cjNU91js2yko3IuNWtDNdTzSVja86UcmNhoVIXbgxLXML8xiv0OmElNvcbC0Y/JWExztTAIbX+eifu8Pw4uGZwNB3BPDEs1zHTyI6SJOU0iAcToOjliNpUKurdsyLnOEN/XD8BpkInYLEGYcYVnMkT2BieEJAQHIl/EaL/lnEE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HFcwt9zn; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HFcwt9zn"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7dc6d090381so19807267b3.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 02:11:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780045909; cv=none;
        d=google.com; s=arc-20240605;
        b=dQN0/oVqd1qGd7ntK3r3/LZ25Qaqd3wypgO39ljwOTqop+v63Pcbp7XDjBPmwCv82e
         3+nO0svOe/6S1cVp4mhjPVh30voPmQezh/kQlF1PlIKghfkMBG6Z7Nxg63vhHjmQksx3
         knAdUbJpexVnXQ0vnJqLkw+EIt4YK/BqC6yx47sIAyDZbE4/z5QZFs6PESZnjNSWOZEF
         1lopHlZl6pIpHC9EceOSwFXy2W18e4tDxcwvx0+DMILZz93lk0xkXEqOu9/XZRjHEer8
         rsH5lhpUPZIZBZNM5pUpus2I9W7hg1tQZfYO+QeaRZtKFpW582L2Fo1xe6f3fMosNakw
         h0Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CQeCxWPRmFsxaf0wskbw+Y2MvOe3sA3UOSGwrmYqRys=;
        fh=oaV0+nDSBYNVgOb+0O2JAGuU2GqXaUa5xyvIkiBnYgE=;
        b=SamtYiHKNfH42T3LUqY4gRfiqwfC90FA4q0YhSlW3440NY1muF3kNq5QYiWzZ/ZlI/
         rt0R4o9EUapUVWhzpPZ7K0LK6Y6oIQOTi9S0vKzI2C3wNJ3LKLLisWhjfl1OFXSq9R5R
         Qn++AwpakpfKyJg/4UOHA093cPzdA+DxUiriyQAZexF5k5P3T+cMXiW+DmOq2zHuv5u6
         oEPWV0hwBN2o0LKeAn7WSZ4FGz1FO5mPXPcbnVwL4YnPS0G7E4+4qN8xuXcj3g8FBf/M
         gfJZ3dBKivQh20FCcypnuxDMFCT7ei1b5xVCg8uhKFHchM+QTr8bk5GbkZAJglgg2qXd
         jBfQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780045909; x=1780650709; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQeCxWPRmFsxaf0wskbw+Y2MvOe3sA3UOSGwrmYqRys=;
        b=HFcwt9znYhHOss+R/6JVzuObrIYGm7wvrQP1YDEq5vDtVPTAv3IJ7sF1cKHVQZGCPC
         8XWH20xl0myMumqkzSK4034Prw2KhgfDT1wTLoQeM9FXrqs+LmFEmZPDxFTug0F4g+n+
         MESNTThOaXuOl2Ctylqbo9BORJB+a7snP0PGofzYaDzsFgADtmZPIStLa4oOtG15YVEs
         EFB+FiunobvAPD0iwPzJlaAfPWHlg1p+WnH5H1rGeNDZ1RlN4XH7hqcCsvH4wTiP3fHz
         kpheIyb2ub133K5X4ZdcDH/n6mHLpH7Y5En+io+k1lxH9q1JWzypkaikaPvJs0q7/D3f
         oJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780045909; x=1780650709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CQeCxWPRmFsxaf0wskbw+Y2MvOe3sA3UOSGwrmYqRys=;
        b=EoJjjXI8sTHc4tefIp4h5d5JUnt26WSvSiPu2vwyrbNdgdtRcZuWPP+utTjoF8vSKy
         xbrlOyMCDeSL+qdrcQva1vihRH/wmc4MRz46GjJENJOIysW46oYcw5LcILj4uynuof1A
         laL0fH/jbpzTNfIloz7LwDQEVrqsMvLaelpObPjSGPeBeT0FEQ3UKpCpW0dGO3i9bRWZ
         AwjM9TTkCgSwjE8zccxMLgxYkpWqTETtAoB6Vg4McDdHzjaf53JJ94hcuEjMkkzQr/t+
         PJvNm7FcMztkfBFC/dra4H4B2s85bFAOu7rSIUum4NvKAv2GBkd1LYVCF+Xzp1OXaqk/
         Gv0w==
X-Gm-Message-State: AOJu0YxYAUI9c2vs+MpPX+vjl539M0oMqAkKzV2gGMyp/Dlcyok/Ah2i
	X250XZzsMkSoNTkpXmNpfecIQYwgtvG8aVBESHMgQzlorwv5p25Xx9d6ty2Er2N/Iaiu+R56jTp
	iMwTBXHIDk+n944jxEfWBMZtl58f9PXMs+2NzaZ740g==
X-Gm-Gg: Acq92OEKTb3YOwr4gkxwq6my3ZrlF6Jd9Cx1hbpI/O6/0t9WwH5vNAJUS9mF8qEKver
	cEPB2+GTTDMAtehdQQBv5Jwbnn6AA/NJfW1rFBM7kwlRjH79eGF8h0t7TRUEOz4DwjH+jh30QN8
	rCC3IUqzxwfyvShFgP08TH0tOxMkMXksQQKg3IGyBDyaxEx5fKJUWhmtUFWbKO5LXX1Ezm359Da
	9VImhljiBkOctowmpauaEuNtQ2xK165jiWTsRGgDoyM1iXjlPoo9KqkwS85B0rrU97MRuh65hMd
	bakfE1cViku3BreskziQsSV9kPi85/ed4ivIiRR3vbqxNvtrt7AD1elw0wCu
X-Received: by 2002:a05:690c:6b10:b0:7d0:1583:4cb7 with SMTP id
 00721157ae682-7de465efe10mr14565977b3.15.1780045908886; Fri, 29 May 2026
 02:11:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529034542.68766-3-laoar.shao@gmail.com> <20260529043212.1F2ED1F00893@smtp.kernel.org>
In-Reply-To: <20260529043212.1F2ED1F00893@smtp.kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 29 May 2026 17:11:12 +0800
X-Gm-Features: AVHnY4Kx8ICsYHlCfNys4HePTH5AEmq9LURZ7cbd0SG44HJxZd_BiP2F1Zp4Iz8
Message-ID: <CALOAHbCfZ84TYvc9rx3uHngZ+QO5+T4cUNOe3s1_f=UY3sDrdA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] livepatch: Support scoped atomic replace using replace_set
To: sashiko-reviews@lists.linux.dev
Cc: jikos@kernel.org, pmladek@suse.com, song@kernel.org, mbenes@suse.cz, 
	jpoimboe@kernel.org, joe.lawrence@redhat.com, live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 12:32=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] A malformed livepatch module with a missing function `old_name` =
will cause a kernel panic during patch compatibility checking.

The same issue with Patch #1.

--=20
Regards
Yafang
