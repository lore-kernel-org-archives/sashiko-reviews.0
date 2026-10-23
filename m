Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758967;
	b=EzfiagPdu2JCvFGQ90KrPy8AFtdTEHA44rLKq9T9JLHTcHOa4BCvNiBcxix1PlTRtn7N
	 t2koao06chR5yRb8ZjmARjGB59GDGjsS7CRb74HYTgchoojfZkUUlyuNHjSgVQhG7gZXd
	 8/z2IHOab1KXvzKFXVB9KCUAFFdjEDo1p2H9jglCfWSoHUh3TXo5woOWxxhY6+N8cztML
	 gvGkNfk3kRjMIhIir3sYhL/QYgVusTHmxiIROxwwgdikvYd/mg37KimkVco8IPnvke/G/
	 63kp8qSrmcpZW6HGfKn4ftDnaEwjYSIgXhnf3Bv01O7sOD0efMqDEV2misgmtF/q+jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EmfKpji+90isn+q04JehTBPzQ9AQUDyGYMHQgJ4/n9Y=;
	b=vSyPMlQGS/p06J2itw2+f+xE74/MDOgcr8ENAuoU8+TWWHmNTFPxEK4Ep/p1euvpjGJo
	 LIirxgisRTS/qi3H0HQ5RUG4rJCP268eGe/0ASv1AcbwKJq9pkp67S/EDSqyOyR+PdbTc
	 jGDaZEP9I2zY40aqdGCjdtJvutMJKyi5bX5mhckGcxD92RbSReovoxgvzGNW+S5baDuak
	 BGF8rh6Z25o4EzSnGb4e/UC0VBRy2OV1fxEMBtMOnKilSgn5XEqYEurQVgHVOY6vn1OMg
	 Q7PfQP+1J8BVNPxqfF+YjSp7oHA+inF8SyoFF1kEl/zP2qwdpp1Q58HFVCX6Y2xbs0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q7eBU3d+;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C351606A31E
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 12:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C351606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q7eBU3d+
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ccce6d9abfeso536834a12.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 05:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792758966; x=1793363766; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EmfKpji+90isn+q04JehTBPzQ9AQUDyGYMHQgJ4/n9Y=;
        b=q7eBU3d+ogFnvM6lBe5mErAqJSlCmjLO20XOesIrAMa++6DB3DCTPhW7zKmcouNMqe
         ZvIs6AyWeLW3xtuyxFXilgnn+OKNY9f5BSH6iG221J4HEd2197gbGzUQTYdPN7YCwMm0
         sog5g6jDdupEs3dIjcGEwq3JhjUVYvJEBGWbsL2MjEnlQFXKvTzbL278xhst+JNxD3+v
         VXsIYCLDzEbPpSsFH8JzZGUApPv7WFm4DgF9ziSJ9ebhWaHadxcKY3wU07wGfd2hYaSM
         SGVl1eobTEexiO0Za2Plg/svZj27jLjbVs/oHsgjukQvYrrD382pVVmUc1qa9MgnzJWB
         +s3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792758966; x=1793363766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EmfKpji+90isn+q04JehTBPzQ9AQUDyGYMHQgJ4/n9Y=;
        b=0aldZF/N3U2DY1/QcQrSgzL1SvFsd0C4d1ra4WTrwDTP3deTrXdniZO2NRr8EWlS8Z
         pPpYk1HXwzu4WgGBvkmG7kbubs4te4q/OtgCMqKfvDjOMpZApJNRj0AgJVQCuQh4brT4
         lSM66B/4Eqmgcmuwql2+41lhApdGk6L0o6HbhQD9+10EON1Rw0FRUDIeBodbujpxX3Jj
         ul/BXXuXFsyntPy1OhsNpGOkOhkLTBPT5RQqozWFD7EtzcMpkH7nXaOIYx2Nc/jlpEA/
         jhRCyl8zMmjnBBIip2uyKh55/KRtSLmPFC/QAv9De6yDZBzgFe/OIzHf1bDAUSzdZFAr
         yzWQ==
X-Gm-Message-State: AFq9FYLzDvCcmOlpruk1I4TMvd03+fYP1AnuZpOs6gc8iEk19NMPfn0a
	pgW0SrLEmRm4II6duRIA+f0chPuW8XzLhXEUkWBhF/Sj8Hn26cHA7pqAy5jETDrUW6QYfg==
X-Gm-Gg: AYBFou1RTbXnOZBa7aUjMRz9KOOO1Xjr9u63yDSg59/CRNeZrumSLm1nT5AjG9RMFOe
	iPfqhb0WyiJkoyF2mZ4MSYEe/jq3xEwbBlsm7uQn5UjJ/gv/zAFgS4WEwxTfGnxb8iiEM2cn+Va
	NZEbX3Zd4HuFC0m+oxKjI1nie8LNObZf847F7tIudhR8bV+NEOAvZbVQomKSao7TPst0/kJQJr5
	K1Kox92SqVypAoipjWsZIDJ8zTXE73KO+9WCh1vOqvbhc05mXiiPBbNJOHsUuR8QkDNckAmyRck
	7Ui5G1Qo/WvNb4SzMEXgDs/ToFOakB1s366GxCOwIyHMJhhZVoI9qmFqK75ZvMcesugjvjlRBxf
	+Gr8PZQHq3cem6sh1UEFDdP4RmA1uwF18ddS9DHSwT0GEvRX2v2fN12IBfkDT6Iq8Hqda8/V5Ks
	72OCHN4Iw9bZlkWidIZegV+LkguFzA6E6T7Hnb8vMosFtXotOozHva6lStKLsR3IrB6Jif9niir
	M/E/0vQBWi/x496z2VH1PLnw4AvbhZa9ouqlejtGVl6P7rmVpVO29xOtY4bIypo+Xrn66d/
X-Received: by 2002:a05:6300:392:b0:3e1:6acc:5b08 with SMTP id adf61e73a8af0-3e37676d16emr1403665637.63.1792758966458;
        Fri, 23 Oct 2026 05:36:06 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a5342sm684757a12.17.2026.10.23.05.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:36:05 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: sashiko-bot@kernel.org,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	olteanv@gmail.com,
	mani@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	val@packett.cool,
	wesley.cheng@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: qmp-combo: Leave the USB PCS alone in DP-only mode
Date: Fri, 23 Oct 2026 21:36:00 +0900
Message-ID: <20261023123601.374-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <sashiko-outbox-181846@kernel.org>
References: <20261022165219.1368-1-26rote@gmail.com> <sashiko-outbox-181846@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 22 Oct 2026 17:07:04 +0000, Sashiko AI review wrote:
> - [High] phy: qcom: qmp-combo: qmp_combo_typec_switch_set() powers USB in DP-only mode
[...]
> Would this overwrite the serdes, lane, and PCS tables, time out waiting
> for PHYSTATUS, and call clk_disable_unprepare(qmp->pipe_clk) on the
> error path while qmp->init_count remains non-zero?
[...]
> Should both qmp_combo_typec_switch_set() and the power-off path in
> qmp_combo_reconfigure_phy() also skip the USB PCS when qmp->qmpphy_mode is
> QMPPHY_MODE_DP_ONLY?

Yes. Since 89563a152973 ("phy: qualcomm: qmp-combo: Add preliminary
USB4 support") the mux keeps usb_init_count when it enters DP-only
mode, so an orientation change in that mode already re-ran the USB
PCS power-on over the DisplayPort configuration before this patch. v2
skips the USB PCS in qmp_combo_typec_switch_set() as well.

The power-off in qmp_combo_reconfigure_phy() when leaving DP-only mode
only asserts SW_RESET, clears the start bits and puts the PCS into
power-down, which it already is in DP-only mode, so it is harmless, but
v2 skips it too for consistency.

The pipe_clk handling on the error path of qmp_combo_usb_power_on() is
a separate issue: pipe_clk is enabled in qmp_combo_com_init() and
disabled in qmp_combo_com_exit(), so disabling it on a PHYSTATUS
timeout leaves it unbalanced whatever the mode. This patch does not
change that.

v2: https://lore.kernel.org/all/20261023123512.1912-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
