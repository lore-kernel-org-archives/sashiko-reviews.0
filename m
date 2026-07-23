Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6BF40BCB0
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 08:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784796257; cv=none; b=lkjac8TPM3EL9psWtAEkQ2AikAGIYorIDFdWCQO9FzFn0Ot8DLTA9du6PJSD/hy26tvGOzj1nU+q2oR3h6SsTED5uaSxvLn0eSIU8Qtrn9IZz/QubIZRSkPN4R/X+m6Ln3mBSi1o527l+12V5z9Kcj2CukMx1cLXekIXIrRcOQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784796257; c=relaxed/simple;
	bh=j2EBRvjl4THMhyqlpfuX6DTQgfmPpqpfKHZum4qGV80=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nIFQ4NAr7+dNkcCTu8B1y4TvNkuT74cSjTy3aC9+EuLCsmqClVShJPWSyrPRQe8uBtwFJZ23OjYq31kRWSY1CT35UQVXJ3eG3egYPKczrGqMj1Oj1aY8aU5qrMZNBnVnJcDu3Fygzk6kEfOXBvZMSfWfMoF4okMY8QoRGEJUzek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=THF6famv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="THF6famv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA281F00AC4
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 08:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784796253;
	bh=j2EBRvjl4THMhyqlpfuX6DTQgfmPpqpfKHZum4qGV80=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=THF6famvtIVujmr5lEQWgibi38Sy11MWWMW6+2tKYo05BvB+wHKHZGzOD0tP9Pq1N
	 gg3t317Yv2G4Jp16elPwKIYbzhAA5oQkwBK6QYMkucqP8WT24/jCezkij4g+fEesXw
	 8iuWmkkDIXm4LJnx04gfLuF2WrnCNdoRVEPjbtLDEtZbTQuAzXHFe1VOuRvAnWODLN
	 Mbehb6V2Q2aA04xCdbFca9G6f4L7VaJIXjuH9LrsArUpTPN/7gXSHWIM0uGxXUhHJw
	 y2DdgnUBLjj8P++311he+Wsm5d2fIaDDo7yDJRwiMs3BxjaWsT+IDEnsMohF4wkJTD
	 x1PtwBcD0f+Iw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39c86945164so2505891fa.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 01:44:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqLQoCpbmy+xUQCktXpT45ugIemivE2hR7eyoy+Mz56H05fD4h+usi9IISaelLYcGgqHMmIJMTgt/738DM7yjE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzeoeM1eRGc7CDIA/FXWtUPT1yGhDHlg7nfB8zakSW9GkHXtFlO
	7xT0fSksyXEYgS++A7yLE1FyvDFTpKoce32K54MUhAMQf+1MiHQp4qQLaJp5VlE1NjkfUNcGbRO
	Q1nk2DbMS/n4qwucio2vyaP6tu8FjSzVwaDJRpVdF+Q==
X-Received: by 2002:a2e:b8d5:0:b0:39c:8124:93b3 with SMTP id
 38308e7fff4ca-39f07bcfce0mr4681721fa.9.1784796246084; Thu, 23 Jul 2026
 01:44:06 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Jul 2026 01:44:04 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Jul 2026 01:44:04 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <amDuqoRBg5qGafi2@linaro.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-6-1be02deffda9@oss.qualcomm.com>
 <20260721134853.2B2401F000E9@smtp.kernel.org> <amCGXUUd4VmuQRGD@linaro.org>
 <CAMRc=MfBNB0pvv1kPPcswE4Y2m7PXBO49bwJg=v0+aY=JmJKWw@mail.gmail.com>
 <amC7_M-HjVZ3sQuT@linaro.org> <CAMRc=MdnSyPmbK0skMx686=wSe52nnuWgCNJ0uSoKs_=HyAq-Q@mail.gmail.com>
 <amDRxPkdvbA-iVer@linaro.org> <CAMRc=Me523xQbfJvML9taJ-fR128SJurJS4eX9N9E9WtHF5W5Q@mail.gmail.com>
 <amDuqoRBg5qGafi2@linaro.org>
Date: Thu, 23 Jul 2026 01:44:04 -0700
X-Gmail-Original-Message-ID: <CAMRc=McJBVkCT+rFToY-Sn+nrLy-Sb8otz1NYWkQj1J-4-RK-A@mail.gmail.com>
X-Gm-Features: AUfX_mwJQKKrlt_uOHiEXNJho9ROwjpR_PSftHZZM5GhDPu9qwbx9QpVEO72mS0
Message-ID: <CAMRc=McJBVkCT+rFToY-Sn+nrLy-Sb8otz1NYWkQj1J-4-RK-A@mail.gmail.com>
Subject: Re: [PATCH v23 06/14] dmaengine: qcom: bam_dma: add support for BAM locking
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Md Sadre Alam <mdalam@qti.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	sashiko-reviews@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Jul 2026 18:24:10 +0200, Stephan Gerhold
<stephan.gerhold@linaro.org> said:
>
> FWIW, I couldn't stop myself trying to finish my "write lock descriptors
> directly into FIFO" idea, once I started I was curious how it would turn
> out. I think it's actually quite elegant, the loop in bam_start_dma() is
> wrapped with LOCK and UNLOCK, later process_channel_irqs() looks at the
> FIFO again and just skips over these descriptors. lock_ce is allocated
> once at channel creation time, no other allocations are needed. (Could
> probably move lock_ce allocation to slave_config() so it's allocated
> only when locking is configured for a channel).
>
> See diff below. It doesn't crash badly in a quick test, but didn't check
> in detail if the locking is actually working correctly. :')
>
> I'm okay with whatever is "free of known races" and works with the use
> cases we have, so use/adapt whatever you like best.
>
> If you want to use this, feel free to add
> Co-developed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
>
> Good luck! :D
>

Oh, neat! Thanks, I may use some of that. And that makes you have a stake in
this series now. :)

Bartosz
