Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC0D261B92
	for <sashiko-reviews@lists.linux.dev>; Sun, 12 Jul 2026 14:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783867389; cv=pass; b=B6QtKZxmIry+/Sya3D0ZHYCHZJ132wbeBUUPcseLAcGhhKCN6btK4uKwveEF1lcHSUIDZRNlm5e+GIwpaoHJ4LnEkpNf+mjhrTPaDAEPwr57xQDx0d9ZNYR+vvxS+HvpE8UE2x4rN4q65oZLygk6SSHxw0xbYlvQroDkFiGZGTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783867389; c=relaxed/simple;
	bh=pnZ2X0+MIRL60suOzIXNIohxyX26lpfnkqeN7KC7f5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bWYnlDsYwNTUixFvb9okCh0xUOT81pMHjWXwi1fOIFuyHKHnF6MJk64/UBQ5cRQJwHaXyBWzDtzz3Do3jGFXd5so4JOZMtIMmMSuHEMEecIlLAViFB+3ImaEhKdfdanC9s2KRbHVJDL6GGAcL49vrHKZa7uIU+Cq4fGMETGaASc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CH27cLmk; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CH27cLmk"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca80d708489so1367790a12.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 12 Jul 2026 07:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783867388; cv=none;
        d=google.com; s=arc-20260327;
        b=VtiRfP8J8HA6lvFw7bxJk9qGMdSTiwrhJKsw23WwkqScV0qVFC5O6xDX0iJgn58F8P
         Ws/5Nfuo6qe/uWu65sy/bokspCZ+n0EDApzJiIqM57KC3Jms6m0gt9I/Y06WnkMtUqnn
         FYin2bZPb7awrwgjeBwn9/qn4gJETd0ZCXm9dmPCXmEzOmbwqa0aYON6l4gogAKcCqk4
         K8Uq5xINH+Z47BvRU3gwaAZZpIswJZ9RdL/QuFCB2Tym+rBuqiUECumPUwFGZnDh5yxw
         F2rF/iZtspwDbtlQPFCvYwbkyWQylcSsp3neXU502YiVb6p2gFx20iXudkbtGtL1Af31
         bQEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pnZ2X0+MIRL60suOzIXNIohxyX26lpfnkqeN7KC7f5g=;
        fh=0hdvEPJRino8wRvGrrw1gATkOs6ExpSix2L2F38xNVA=;
        b=phN0q+v8g9OueVWI3qDyn6ig9X81Q/nVI8y5HtC8MVEsg/e0FDnxrWmNPmBRxvorHY
         ZtxzO4pG1Gqod2Cv3svAb3BD3so0eH2pWrwjPDl69JyDvs4f9qVhzUzVBsNE99G+pEoE
         lbRwjOWqKIJW7ZsA7preXVQ5F6aeFYnPhhvk1+d+A8vgmDIKc21RLbpBlSx+KJgt00I+
         F2R+lCf/qVunpJkTSN8uOWrSBTEuj3OQCFwCRwV2du7QC29rKlh052sc6nb0mWKP4RxV
         5CRPpqoO1S16rj0glC7/Nuets9WxMTnaiMonRf7E0p1NGr1bW2sPfYQnidq5zMEI8Iuj
         uJWw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783867388; x=1784472188; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pnZ2X0+MIRL60suOzIXNIohxyX26lpfnkqeN7KC7f5g=;
        b=CH27cLmkru9qKih7twvK125ap5zzB+7ahoQCvhr5fKxuQ+dZFyB0YHcxr+3TgUuM3r
         XtpsyZBVn8BFImO+AxZJRaXTk72Pl4tNirqOfx3PuFL2soIW8MNL6w+994KeV2exf3dN
         XHNY+tTauCseftYz4/EpvGt8NXsAuA5ibg42XDQ8TB3B9qrjTDBURhew26RqvE5mBrY+
         H/zaTk2B3NWaM/WfxzeF8OJHM8sm0gF7HB3rhoDQ/5qKL8R0Cir3HoWfk/hDCKQISSYQ
         c+HSBBPEGatLv39hT2ZxzFoQuM8f533FRoUSJI+kP1QrMJnhsku5KCxNywL3C08z8gKF
         DhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783867388; x=1784472188;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pnZ2X0+MIRL60suOzIXNIohxyX26lpfnkqeN7KC7f5g=;
        b=tGuyAp6SoNoZsiKdOxelpvpa8DVAtohaYUTiWDo8545O9N1Xmt76TTzEN/Cec2EwXe
         PQh1K89o/jYslw2kdok0qHkykDZLrJCO3l/iBOLgZjR1Xf/uGMl67FwyXsY0iMWZ34Tn
         YbZ+7ypCEFFih5aKuuIPgoUASGk1JsNbRTxeqBKDjoqvbGrV67U/Rqzl0Nfc9vyStWh7
         MpUZ2vormn4ENzW8JA0tjW1NN0nzwFdV2EepdPs5YZAcmM/c2d55QUW20+LlxtfbDCdO
         pK0McHw6aF/t3VGNnJ4ZrSnE+EzNuCD52EQIYcxJOrLd7H52URPHVF5QFN1XCIPFAAO7
         YZeA==
X-Gm-Message-State: AOJu0Yw4YQk+Truuxnld0IvoceqLE0ebiNNjUPODXPdC79Y3W6qfS3lR
	Q5jb0bmUjWQY/BwuzJST2kdzZsaV6RogDvpqbE/sUmYZvqfzIO52YdAM8OFwXqCFdkNzgToZa2j
	19pVDXceWu4AkCxmfE7GwXa7kV0T0sayeVjjB7gw=
X-Gm-Gg: AfdE7cmEA2slQMGhG2poPU3yOBKCgYIu+K3uPe/9OeKn8jHRp7vbYFiHo1qE+3Nw5Yg
	WkUrrEdzCnExFA6/eK/5XQXDlDn2tj89HqPH5CKcEJa84IbRwewmGbrIBj0qycsq8SRUMRkiKfg
	Vj7WvQ2c+n8MyE+hOZHmH6kdL68jFj/Ty3G6TMztGqkoPK3/WCETktlVJyipbN/e5jQX7bRusad
	WHfb/2OJ4WE49jCU/+v/d17nuVGFEAfnHKfElQEHLsqwtF23vBMAfuLGAN/+QOdRBcuaEWDXiY=
X-Received: by 2002:a05:6a20:729a:b0:3bf:651d:fee0 with SMTP id
 adf61e73a8af0-3c112d8b12cmr4997706637.19.1783867387615; Sun, 12 Jul 2026
 07:43:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260712130345.1256030-1-eugene.shalygin@gmail.com>
 <20260712130345.1256030-2-eugene.shalygin@gmail.com> <20260712131222.5BF571F000E9@smtp.kernel.org>
In-Reply-To: <20260712131222.5BF571F000E9@smtp.kernel.org>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Sun, 12 Jul 2026 16:42:55 +0200
X-Gm-Features: AVVi8Cf_Ao-qU_t5PrtBUUfuHhqV94KHSFwQKcbOKxNYK9guDpX7OAkXpCVIZWg
Message-ID: <CAB95QASEHbCOs0rgGf3j90CFO_-BEEXAzfx3UVfaLQXi+tRAvg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] hwmon: (asus-ec-sensors) add missed handle for ENOMEM
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 12 Jul 2026 at 15:12, <sashiko-bot@kernel.org> wrote:
>
> [Severity: High]
> This isn't a bug introduced by this patch, but I noticed a potential
> issue in asus_ec_block_read() while reviewing this driver.

It went full circle; the fix for that is submitted as "hwmon:
(asus-ec-sensors) fix looping over banks while reading from EC".

Eugene
