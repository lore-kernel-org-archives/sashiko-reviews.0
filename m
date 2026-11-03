Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713891;
	b=2vAga2DG/Nx12JBB5sbWPuThkXoNsNUIPrIWXomXf5HXLJ1WdmX//Y19yoSj8BbMIx6J
	 2reha4b+KWtUPafG2tEE+ipNtdeGGavG1fodThhGLd5FdfThqdA/fWpRBmnGS3R8cNaC+
	 NaLRLuVRQTdYy30LLWlkY0WiTDWCpQJBWscM4BU+S4KuY8MxMmHTAJi5VN6O+XwJ9HdYG
	 WLK9OR2jLu0SvlB3VcGyU1GT4ZW0yQghBGFz9LzIfZ+e3K4EMpniNd04smrxKDNz4vxTn
	 E2zoLsa8F5AhNSYDWM5IcB8okTpZZ9sC2tcoPzdfBbKitC+nOaG4PRLhdKFiS/ti9DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=jHC5kGjbwQHUmw1E/Aen0JCdyqsz5/FnNe71zqbNXLQ=;
	b=x3qDJK2grtwkpmSn8uhZFCAqMWvwKCu3vB5OnGXWYTQMTKtgL9SPfz1Ch6CY42/ps+B9
	 c4Awp2yAiAxLRcu3ZlvMEyKOBoRkwh4sUzJHZdDNGiwY6DNN6z3UNbQMgLqMCs/tKU1TL
	 oEFd+jIFg9TNvR80CN0+Kj7Uua1bFiGJOBQXaSN25rqGcOKYWQjhRPVN4htDL5iDOFDsN
	 j4CQ8SaQN8L5odpcwZofwxA9O6YiYedZ1uQRGQ6y5G4WhcUQN2FoMjVWBs6dHvQ4WCGMb
	 O8ImlC8KSYFdion5SpqICMs/bni1CaOwhSzgDp4z+GC8b6dGYE/Chjzm2GNolaFXzBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bB0+DeTK;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5918C606D82D
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 13:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5918C606D82D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bB0+DeTK
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-19305bcb72cso3108438c88.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 03 Nov 2026 05:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713891; x=1794318691; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jHC5kGjbwQHUmw1E/Aen0JCdyqsz5/FnNe71zqbNXLQ=;
        b=bB0+DeTKPzMRW+QcUrzSAGVc3vNnIl9z9vgyMXaoDRQCLus/VTjstqKiiEV3vsEaEh
         cE+HJCSTy1af1O15YoeZkssfdSKjRN7sYHeqohhkEdCtn1lq4HO7oSDxIUsAaFEjF+E/
         wM3qFUTOukm4eBM48xKlQPv/cEHQYOwy+X2lgc09GoXxYkRSIPrT7gCWlpWtLkCdRYxw
         RrakA8j3zzowhoz/M+h697fDA1qKv2PxUGWZDter5QAnQZ9BVg+/rgjAa1grmy0jpC+U
         w8mfKIrplAIkuj1NPzG6wma36A1eBw3P1aT1KU6TUYVO7tHSFK25fY/L7KFn1CztJyoR
         qcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713891; x=1794318691;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jHC5kGjbwQHUmw1E/Aen0JCdyqsz5/FnNe71zqbNXLQ=;
        b=dKIK18bFj3gpRdCrQKGYQdWLBtqXsqNPKcR8ckKkjRXDERvH/9HEDM99R4fXdewyCo
         ytEPS345JlHIkB/hDfWnjWds21UF2oergVIs8XlEkNAJf2sZ4icP04V7PSqQskvrtpDQ
         7JcSeXLhqKuDV+6r76o0ftI9ADDqgFt/EU6PCsQ8692xKLpDtnvdvXv5WtRBaXf9+ghL
         BeWLjMEj0+PzgpwTqGVArv/6ldvc14pZnv9bwPfqW6ucYW37BZehF4IrEEVVp8cjqzIO
         VDUoOSotHeTsf7HuJPq9U8nJ3hnSD+NN/s0iRpoVUqY7MX6TUgv0pKSO/FsS+hxNMV5m
         sZGw==
X-Gm-Message-State: APuU4Z9hpCbh7bRgpcEZHbK6It6NBQ0U4gD2TIBs5p7ZuQUDXiBzJbq9
	AfMHRkcg/IkZB+q8KPgld7byWLOGIhK8LMbBWIuMZDe4X1HmQevbPjyCG5stxZP9u/LQtw==
X-Gm-Gg: AYBFou0GLXErejjPKBwkW6xvWDaa10uXE2BU2iVPVFac9utTY+JY99EIrvywr0L76PJ
	Cou8KlHK2dU9KinfK2RwNsI920Sa/ba4iE+utz6wKo7vCA0w5RlzU3jojufRcBCGr8dMXwe2PC7
	6PuIdZi67r2Kvh6OJnYLHSwURZqfmwP5kOTod74CK5sIcU81Sna2tRGKdpF/2zRNs6w0TFQGlxO
	BNxryiEqJPqSUTxv+UP7ghkdIxylU3PbVVcb/NbmtHEKTQfEiUwvpCgQZ16JaY8WAtrsVRmcI4M
	BjmTlMBCukPsnWgvueRqyqX/5DwTKOdabfNoj0qTcICIQ6pd9Wt3bWiwxPgq2AuY1ebSg2wsnCR
	uTJU10eRW2e4lPQ+/dSLL+eSqUCywZbUau0xxSLWgznvnuOcn/paN/DCMx59lCAbaA9HgK+uzw6
	Sc2hSELtmol7MOMUorkjVco9rTx2lkra/CE4Cw88oM1Tm33pAoUAnQ6U9JOkvvD2ViEJxJacY4X
	bBGy/6zT7DqmsA+s39xKIyoQ4nX/3CVO9AaFMLwZI5CrMKj18GimtE+5/d/aqA7hFzlRL5OKtHw
	VSGAET75BZT2YtYsurO00hTJR8DQLDB/tnosOJwcJBZSyg==
X-Received: by 2002:a05:7023:d0b:b0:191:ac4:55a7 with SMTP id a92af1059eb24-1ac5b024d1emr20755825c88.23.1793713890250;
        Tue, 03 Nov 2026 05:51:30 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1d4dsm39536340c88.3.2026.11.03.05.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:51:29 -0800 (PST)
From: joonhoekim <26rote@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Joonhoe Kim <26rote@gmail.com>,
	sashiko-bot@kernel.org,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: dwc3: qcom: Use the UTMI clock as PIPE clock in DisplayPort-only modes
Date: Tue,  3 Nov 2026 22:51:29 +0900
Message-ID: <20261103135129.1961-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <sashiko-outbox-194253@kernel.org>
References: <20261102215121.738-1-26rote@gmail.com> <20261102215121.738-3-26rote@gmail.com> <sashiko-outbox-194253@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Joonhoe Kim <26rote@gmail.com>

On Mon, 02 Nov 2026 22:08:43 +0000, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Can the controller get stuck on the UTMI clock after leaving a
> DisplayPort-only mode?
[...]
> 1. dwc3_qcom_set_role_notifier(USB_ROLE_HOST) runs while qcom->dp_only is
>    still true, so dwc3_qcom_update_pipe_clk() does nothing and
>    qcom->current_role becomes USB_ROLE_HOST.
> 2. dwc3_qcom_mux_set() runs next and sets qcom->dp_only = false (for
>    TYPEC_STATE_USB or TYPEC_DP_STATE_D), then returns early because
>    !qcom->dp_only is true.

This is partly right.

The replug case is a real gap. On the Lenovo Y700 Gen 5 (TB323FU,
Kaanapali), the USB mux state has always arrived before the role
change. But nothing guarantees that order.

In v2, dwc3_qcom_mux_set() switches back to the PIPE clock itself.
It does so when a USB state arrives after the safe state. Once
DisplayPort is powered off, the PHY leaves DP-only mode in the same
typec_mux_set() call. So the switch no longer waits for a role change.
If DisplayPort is still powered then, the PHY delays the switch but
the controller does not. v2 does not cover that case.

The other cases do not leave the controller behind the PHY.
qmp_combo_typec_mux_set() does not leave DP-only mode while the DP PHY
is powered ("DP PHY is still in use, delaying switch"). This covers an
in-place change from C/E to D/F. It also covers a USB state without a
safe state before it. In both cases the PIPE clock stays stopped, so
the UTMI clock is the right choice.

Your question made me find the opposite problem, though. After an
in-place change from C/E to D/F, this version clears dp_only. The next
role change then selects the PIPE clock while the PHY is still in
DP-only mode. v2 keeps dp_only unchanged while DisplayPort is active,
as the PHY does.

> [Severity: High]
> What happens here when CONFIG_USB_DWC3_QCOM=y and CONFIG_TYPEC=m, or when
> CONFIG_TYPEC=n?

Right, thanks. The arm64 defconfig has exactly USB_DWC3_QCOM=y and
TYPEC=m, so the vmlinux link fails. With TYPEC=n, the stub returns
-EOPNOTSUPP and the probe fails.

v2 adds "depends on TYPEC || TYPEC=n" to USB_DWC3_QCOM, as
PHY_QCOM_QMP_COMBO has. It also skips the mux registration when
CONFIG_TYPEC is disabled.

With this dependency, the arm64 defconfig builds the glue as a module.
If that is not wanted, the mux part could go behind its own Kconfig
option instead.

v2: https://lore.kernel.org/all/20261103135057.1682-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
