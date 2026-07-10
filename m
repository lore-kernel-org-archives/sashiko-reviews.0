Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7200347524
	for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 20:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783714638; cv=pass; b=sJvLEPvC8fILbD0+DBfGZNa7lnYByJXunECtL2oX9TrCS9nUqgbVOf9+KYqCz9XTFh6WV9BOPRjcELtaesmNIAMPT9gHfvPfSN9OLnd4wDfVaUOzXdl9xxzkzeSGJ3WOENt4R97Jdvky9hS10lapk+e739x5NE25G/tMdzPK5iE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783714638; c=relaxed/simple;
	bh=Y4PxDIWZ8cuCtlKygAvLCUl9kmb0W8gzO10lBIXLIFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oterEVvJXNsebSJ3m4If5SI3lnZ0+dMqhmWhPq+CjSPjBw0SiO/BV4TgfI/MI60xgEe0VsIPPOPSdnnFW3yPdf2SM/dXnbV2fHwkGF8c+gjWowApzE4KbnxOp/90Ii4GURf2YIpEu+iSvdi7B8BF3JRqKV+egR/iEBI/dvPcYdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ci34p0Ly; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ci34p0Ly"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c15ba5b151dso192809466b.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 13:17:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783714635; cv=none;
        d=google.com; s=arc-20260327;
        b=cL46WRiBzYF6V1DmPN5lCxf3LINcdDB4dx37CF2CT7NfCbOZ4vBiC4DlAnbD0hKfVS
         Dj/izIeoCr+V18rndefsMrC6hKEfSI+jISOzVD4BbNN8jvsMpTNb1VcvpaJhKsx2KR5N
         xVbKdq8MnrLmGR01pDDbHetBm5NMvO/hznBzZChxHb+66JKcv6z3EIGP4K8i8YVF5D4z
         QuXd/PomemM/+esjpCU3oSGr2IzX06xOWUhscMy9gN5xDnyFVYkUhRzh5cPZsRIZRpq2
         CkRVmG0z1R1P0ca+iCrMhSA0/EnfdTMkx9aEP6ahvdipPTUPToNxgTfeZ3k+ShCBXHLX
         QYZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y4PxDIWZ8cuCtlKygAvLCUl9kmb0W8gzO10lBIXLIFk=;
        fh=qzlJzbqy1PX1w6zGArpGYde8pXXsncKvAVZw5kFQOk8=;
        b=VwUsEpctEgxhoFwplWZsxEdIp7HdfizsYJVifYQGmKBwgX+ExH91Zg6t/07vpIh6Qm
         QOJe6hk09mTv+J3U3ZqzXZqkLCCKZQUcoVKwj2JyKZVO8fKsEBMihL0e5yMr1G5W01TH
         8AlmVs7vFqovAZJUZp+9XBao2dX4EPTRXGIbFg7Kr8+ASM7R5v+2/CKRn2YOhspt72LD
         GHoPqR31b3Awp6oPRHk4XmRDTR7QltgSCd3mCZ0k1BP9v4c+1a1rfGsF2Bfu/svXtUyy
         5KVUYuQb2PGyk/EJEI6bSzF1abPN3A3WB1diaTQnn19QuuiZuJfxLsahURUiELUnHvD7
         w+tA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783714635; x=1784319435; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y4PxDIWZ8cuCtlKygAvLCUl9kmb0W8gzO10lBIXLIFk=;
        b=ci34p0LyjfQRCtSMMEahKFURHvhkgityWJzCTrugl0ld2N0R3vP8ufS/foaBt9yd54
         VhpML8qXYkSV6vpTsf9MhB+u7mxwEyf566oNeyvCk+1BAygmpyXDZPqupmXLcHoFbpp9
         EabmGkWAt0lX+7fBgwcU2VD554o3W+ls780d+jePDm70Q6TJKDxA/Dj7I0LB3beKTpHe
         7SXuaz5/eOetg4UaAsep369ZsMJBJx6HU1rh85vQcEyjv5Fuj3OAtnN5XVeY3C3wJiZn
         OBM9snqPbVpktUq3LsE5pHZ3L3ggYv8xv1mvrfet3Ds5upHDxyi7OrHzSyG9sL/bT1sh
         5s0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783714635; x=1784319435;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y4PxDIWZ8cuCtlKygAvLCUl9kmb0W8gzO10lBIXLIFk=;
        b=NF9ENDQLsAGTuM2Wyk2z8sqh8boYxQLVgR69oLyl3z+hm6LQ7RosUERvg56Tv8JfWa
         WX5adi9jO8y1Yy1QX5bM1c2vBovKJMFOXNYPWUT0Nov82ScrdKLsktiidCv+c41+Q6b/
         Fbr9xGv7GHiwDzvJv92pGGQDxukE+162WteobqJCCcl4aCWlIs6PvfticWeRDtUeM1Oo
         a2t3R4L26TkQTi4cm6SyBVf8Ds+hizUL3TRzBKZH81OrR1JkCb6HgnEjK/Tk3w2RiOaU
         uOxSTzWRIZnPtwCR78DS4SS85f4rAzlS5Sg4i5u5sgqCZBV4F30o9Z5XIlh4wlNU1jb3
         8yxQ==
X-Gm-Message-State: AOJu0YxqUVl+SaFX/tjRGHIyzxHQNEEiXOZtku2EdbG9aUlc2oSpHMug
	MWPtvYU/N/7qsTHO5xVipnFTM6g17uXe2je3BmzNDEns59K0s88Vn2gz59jNMC+NZqf4qYqo8vo
	rl6nAUwARSEuGdzaE13rhw7ztUP8Splg=
X-Gm-Gg: AfdE7clCyu4v3+SyDDajbXCroiOBj3AsfsQW9bN4TK57VRNCLuETq732UXgjty6oVTJ
	nlRy0UZZ7PjybvJC5/2Kkw+4fuOuLJhRrFpYNL+WjGmJFVTNueWFQIAC4XsgBZBraQqSTiESbU/
	iGjZDgtscR72KGuShfAeJJtFlF+mUW5HlFmkHXb0QnDUApHIqeqaPNfaO2R5Kxv+f/qT+tUeiq9
	/za5TaoGfdzMIE3Vki8C3p7q7yz5XFtpkQIVCYRlo1Jv5xXYUS+Q9hBQV5xsyDlVIKESJ6AJp8=
X-Received: by 2002:a17:907:3e1f:b0:c11:efec:6ca9 with SMTP id
 a640c23a62f3a-c161e957178mr13260166b.8.1783714635022; Fri, 10 Jul 2026
 13:17:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260709182800.2037938-1-main.kalliope@gmail.com>
 <20260709182800.2037938-2-main.kalliope@gmail.com> <20260709183918.E42371F000E9@smtp.kernel.org>
 <DJV4TO9OH6AN.58C10SBPE8FF@gmail.com>
In-Reply-To: <DJV4TO9OH6AN.58C10SBPE8FF@gmail.com>
From: Admin <main.kalliope@gmail.com>
Date: Fri, 10 Jul 2026 16:17:03 -0400
X-Gm-Features: AVVi8Ce7nxoaP15UgvOn9HuvcMHcwPU6nRe8Rrrfu2vJWWJjWqqoYYbC7UgQaF8
Message-ID: <CAJZwKki8MwOmij3JZK=KnnO0hEUuxWA-iY=GK-TtvtVRvOkjOA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 1/2] bpf: Require a BPF cpumask for bpf_cpumask_populate()
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, bpf@vger.kernel.org, 
	sched-ext@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 3:18=E2=80=AFPM Kumar Kartikeya Dwivedi
<memxor@gmail.com> wrote:
> Once this lands, please send a follow up to address this.

Thanks. Patch 2/2 covers this, which updates the cpumask_common.h
declaration to take struct bpf_cpumask *, drops
the struct cpumask * casts from the existing populate tests, and adds
the borrowed-destination rejection test.
