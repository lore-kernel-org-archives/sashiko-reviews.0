Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0650C212542
	for <sashiko-reviews@lists.linux.dev>; Sat,  5 Sep 2026 05:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788586942; cv=none; b=fl+fFlYeGrcGQiDczUX7l5cJ9D4+76yXnMRGUis8GaQ1F1sLeze8r6gUXMO0Gizb6xstS8FSLRUNI8yth77ZoS829nK6DNzwYscXynYftpK+NJc+2Y9Tr6awwFXUB2lrMdC3HEA6ojBncnfUI5AZcXml1b8OWti0RirZ6JvW6cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788586942; c=relaxed/simple;
	bh=1IF3g+wX2qSaik6PWcrYjKLpudWITvu5kEq+Evvga4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gI5Pk52imjuT42epOyqDNzP8vYZLNlJcH16LCy/CE5kZsUJq7RheL4nZM3/KFV8gD44sZZBdbTvsD2S/oVH9ddPrYUdDRjoxvLa3dBqeuzbLXo1fCNs3eG/FenUW9lDEctOmtGU2bpUa4bOo4mqSrLuF53TOWH95tR5dgYbfpKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HlaV4iyV; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HlaV4iyV"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d9201076b3so20946745ad.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 04 Sep 2026 22:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788586940; x=1789191740; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1IF3g+wX2qSaik6PWcrYjKLpudWITvu5kEq+Evvga4U=;
        b=HlaV4iyVJ2fikWX4ULLw/BgiZ5dSMOzT6hps+pCYOqjDXQ0sW3mbdDG8ZOqfgFt7e1
         aBisSfoX9/YTYYjowyt0Wc12jvw+JLtDhgBEEKMUlM3CKhHMNlhHE0PVvgN5SuCdOXM7
         TatWGdgHQe4m2VZDZZ7rlb21xjMyS01XsRoo4+++RyRCSZFUgVILkNPGkcIXhaDfQ9mf
         0KQMUtMqq0Tt8eKy3oHvbzOxzAdm0sBIgbrnKguK2hBCm2/JuokaARNDmxDxDX0IxwYK
         A6vJOhz/XpHPOdBpE7JY27Wnz2Yrrh9gyfnMXbIQTjGcAJeiScSDwcPmvDwOjaU2AjhC
         RKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788586940; x=1789191740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1IF3g+wX2qSaik6PWcrYjKLpudWITvu5kEq+Evvga4U=;
        b=oEqAV6SJiFLGlU8qoYiRzIHXHNcLTJhaNdZ9d8HDC7jNmfORzhzrrQeLXZV7d/mhct
         lHmHLyvMbbY0bxsJMID/dLGs15416caiEW+hANeTT1El4PY/Vm2zG/cWZA+xXRzJIL4C
         3N+NVO1oatRJ5BSTUOb5ekYCoyrvHdtMnZdbkJO5v8asWQ7X3pNdf2TT52Eg896yZIG4
         eOmPcAgbuS0ihm/wn2qmZH+xBc7HiK9osAwV4trfF0Tebr9/BI7QAPPdCoHG0+eOawOZ
         ots8+q1EmDciFOzm8mfWdLlfjS0f6LfXLW9F5BAscwqr7bf/LERoK3MKmXWzWvqV1+/z
         0u3w==
X-Gm-Message-State: AFuF++mvryM5b5rinkZFz6OlSlTCvDKf0UqDsrEOcAbI+Ip0HCgGZ2x6
	43eSmR33twhjWwfJjiFmRrhrJl06i4+HVr861y+CGMLcHHRiZdxF0OI9hzXItEe0nw==
X-Gm-Gg: AYBFou0hypYf+HTRDtizWEKusuOBmSU0lib5T+iI75FJK3DLWr9FOCNCWqrFZ+QWaix
	exucSdXKWqH3BgTtSIbf3IPcVBc1FloSzEDcu6r2AgdgSBAW10qRSgGHpVSMtYIF+22JMO71Dnb
	QJl4Cvu/25kXtWnGRs/iqxFiu+XfycOKJaUj4wgtYoWTJfPyQ5Gzj8p0nyGmEokC/oxujXjOTSk
	Qb6I+LHowvNa5ITfTCIM+Ajl6b+v+nDLE4RQGnL3CBqrQk7d6XdeHoeRt3i04XRBla5Rcge8Dfu
	/aWeU9M0H8Rj3XMl5TzztVDjY6K+m3Bilqma6EEUvx0OTlPanH5CEwc6Y12u4MsARSoE9AFKFjb
	CFmOAMD1CjVcL8CwE8tvGRpuzSt8X9vekzemP4zygI96NSIeWmvSmHYACp7aDHIujUzXrT3gL8s
	0IeNNjr85iv2eB1WghukWeJnoxvhtipWbOH6YWnOEFLNoFzS4uYUMyFJo8AjLVEwE6zfh0g/qwm
	qGuMpccDyV1Qg==
X-Received: by 2002:a17:903:200e:b0:2d9:43f6:59f0 with SMTP id d9443c01a7336-2db1267bc27mr108781345ad.22.1788586940159;
        Fri, 04 Sep 2026 22:42:20 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db149cb5f0sm18020405ad.67.2026.09.04.22.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 22:42:19 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org,
	imx@lists.linux.dev,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH] regulator: pf1550: fix which regulator is notified
Date: Sat,  5 Sep 2026 14:42:16 +0900
Message-ID: <20260905054216.16986-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904111039.705FA1F00A3D@smtp.kernel.org>
References: <20260904105624.48577-1-donggeunyoo.kernel@gmail.com> <20260904111039.705FA1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Sep 04, 2026 at 11:10:38AM +0000, sashiko-bot@kernel.org wrote:
> This is a pre-existing issue, but returning IRQ_HANDLED when the driver
> completely fails to recognize the interrupt defeats the kernel's spurious
> interrupt detection.
>
> If the PMIC continuously asserts an unhandled fault, could the parent
> regmap-irq thread loop endlessly resulting in an interrupt storm and CPU
> lockup? Should this return IRQ_NONE instead?

The branch is not reachable.

probe() requests the handler for the eleven interrupts returned by
platform_get_irq(pdev, 0..PF1550_REGULATOR_IRQ_NR-1), without IRQF_SHARED,
and the lookup loop rebuilds that list with the same calls. The cell has no
.of_compatible, so platform_get_irq() returns the number mfd_add_device()
stored in the resource once, through irq_create_mapping(). Both loops see
the same numbers, so irq_type is always in range.

An interrupt the driver has no entry for cannot reach the handler either.
regmap_irq_thread() dispatches only the bits registered in the irq chip, so
there is nothing for the described storm to come from.

The point about handle_nested_irq() feeding note_interrupt() is right in
general, it just does not apply here.

Thanks,
Donggeun
