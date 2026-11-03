Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713897;
	b=BwA7uC45TSKbWqP4xVvcmcxyfyp+IQvLVkMEhLrG0tOQUzpy0e8xEq3Oxw0ZnlCYYU8V
	 4OVJQRei9q34y3mSICiiulj4DRCEwg6NgQxdpOPgoh/h6e50mEq0l7sSYyaCb+wjzkRvX
	 +unyWucN3lSU8ZGxOGsSL0Xoyp5g3T262AlaYv2QSEIBaFfAj5/EmE9JT6PqDOae7pRMu
	 vDHjPiRz1ohiGn9R3RT99AEhbYXsmQTVChuIJtEx8xl6xHCmRI7lxruMhWmu0S1zzAzPI
	 4G+kaO+a7ai/GcKAV7m7E0yYCdXQ8c7xuh1F1gOlbQpaaRYb85F9c9wNhxctZI3NcNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=iMu1oBeNFPFn7SQ3E0U6I5Z/eHinHibYeQbvleD1Xo4=;
	b=EVVV6TQpw96PX0ePfUCgFpdk/rCbxaEpuLsJbajEff6popBCEiq87zp77PCUA0MWf60c
	 zLmoUd4F5V5cZtpeau/CE9DS6GPdCdDUXhxQ6qT6nU9bK9hF8gAhtYjAYlRZXawamrmxf
	 8ek4Vebeg4b73KVEF7WX+TmEcPZv0ZPTTemJJp+CFpnD4gW+Y7ry8RbwMDumlOpnGvs2B
	 5uDWJwpPvXAE0YUNxLJLk5aMds0y1atq9HnWH4cECBicQNfmGC9V4TBebcQal632G6CDr
	 iO5sf3Rba2f+E+J3czYV9Fl2pCA/OMkOYRlKzLrCB6lHirlBql7d073yS1QpSGfacOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bP8iFq7L;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5517606EE8B
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 13:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5517606EE8B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bP8iFq7L
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1adbf62dd31so4589163c88.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 03 Nov 2026 05:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713896; x=1794318696; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iMu1oBeNFPFn7SQ3E0U6I5Z/eHinHibYeQbvleD1Xo4=;
        b=bP8iFq7LjSTAzVx5vRy731U0ZUbPeJ0uo1wMh24xnLImdZ0EWWobazoR1hhrCj81+T
         clXpcDdQcfDzmb9jWTS08sm3nZbFJkmrmavrwzZoyR8vNEaBSp0lXGe3KnVJdN/4Tc3E
         l3aX7SB0bkoukRe7+EEWcDmZqLqFxgAM0whhunxp3CRw+MbJOjEnfI103Rs9rOcBC5JQ
         iGXy3tGPEsDL0algeLWjiAEktek+kyiIdCthkMHxxfcTuSeAiMkbHH1e8B8EMH5MG9L5
         C10srAW8oHVoyrUAARjhYktWqZsJv8VKeCbf1uybRhskAClGWOP4u1q4nUf1x8QPzj9G
         6ZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713896; x=1794318696;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iMu1oBeNFPFn7SQ3E0U6I5Z/eHinHibYeQbvleD1Xo4=;
        b=EwbsTDTTaH6lAemEXHIPfRn0TPoZmA81wsSMiP/CfAwqcC7eTCgmcjn4aBCVDEy3I2
         t2XxhX8hK5Hq9f9r9sgtakBiDyWidGrtwUe2WySrZW/gT/VjCO+VOVwIlvzlvX68LB4R
         E3omKobWvDKX8LETKmQbEDH4whmSMe/TW/XLJ6I+fZotAfeEDE6WkQ8A8AHB4NeO3csI
         xOawJq4TnOjQfcFCoUilcJwWpUmuSvyrrBT5dVXAgw2VVql1cmYCQomqqSt0tRIQFojl
         EkLeBtP/zwm1DRleOBq5dhbroWiQoVN0iiBWook8G2GSjdgfxJUO/3iFkLZ39jWBna7/
         9SIQ==
X-Gm-Message-State: APuU4Z9f2x+YYlKX+nEc49wzFPqTMTr3IbotMUgF/E36XUtJxH8k3+lH
	7kW+M52GCRS8DzL1FUNQleQTsFC9xP8b7ANJ/5sjNR7m2xpiKPCmjdjIXbRbRWXJZyr6pg==
X-Gm-Gg: AYBFou3sCSVVRnE87Jf66hLzmPHLQOX4G6fQtEbgEzwCjZnX0JGLlD+puDrktzNl/xS
	9kOG4dstwuSqfmLuq5OvhZYPkOJzSC9PVa0ZSGBG5XHGYye0ap3QIQDMbsyud3/a0dONQn3By70
	bvFCW7SrdTkb9k13mHtUh6ncLfcdH8fVFTv7x0VQpIDLTU2q5/1Y0POIXvF67iT0xtjre/MJFAn
	u7hHudShcI1+fJsQfrp6MWe9poEsDgeLIHyVKBu92bXae7HjBnoQVA7JfQto7ro/xgLSt85+SUo
	I3ywhfjGtHP/l1ErqwMegf/MPcQxsrZyFaX0y/MxwxImTpULgaA7qMMvhL74BPn+GgDrsjiAQB6
	nd5fAh7dZ7Bkakwnq0uviiluuaBA3vmF8ZaRV4EiQvDrYVKdNqbrKRcRecrB8ibqHa1qT+/jaMO
	q17WqxJ3ADmgi1MNTjohQgJw73PI4yp1XErbUqekA18VDyBR0XVa/rQ1IgETF91niBHab2EmCxw
	6tau3CgrDlNfOOO43Um5dQvgON2bQkydIjcQdXE6XkMc2xP/n3XgNVSd2WvsE0B5hwzYQ5QIMyM
	O6dHMd2kBrgWxfocFf9/fj6H6NjpVaZiV9Q82ptWsgJt
X-Received: by 2002:a05:701b:4349:b0:1a9:d04f:1b55 with SMTP id a92af1059eb24-1ac5d0da4acmr18652995c88.26.1793713895766;
        Tue, 03 Nov 2026 05:51:35 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b38ac58sm41742846c88.23.2026.11.03.05.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:51:35 -0800 (PST)
From: joonhoekim <26rote@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Joonhoe Kim <26rote@gmail.com>,
	sashiko-bot@kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: kaanapali: Mark the USB controller as a Type-C mode switch
Date: Tue,  3 Nov 2026 22:51:35 +0900
Message-ID: <20261103135135.1977-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <sashiko-outbox-194270@kernel.org>
References: <20261102215121.738-1-26rote@gmail.com> <20261102215121.738-4-26rote@gmail.com> <sashiko-outbox-194270@kernel.org>
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

On Mon, 02 Nov 2026 22:15:59 +0000, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Does adding mode-switch here expose build and probe regressions in
> drivers/usb/dwc3/dwc3-qcom.c depending on CONFIG_TYPEC?
[...]
> [Severity: High]
> Can enabling the mode switch on Kaanapali leave the controller stuck on the
> 19.2 MHz UTMI clock after exiting DisplayPort-only mode (Pin Assignment C or
> E), breaking SuperSpeed USB 3.0?

These two are about patch 2. They match the review of patch 2, and I
answered them in reply to that review:
https://lore.kernel.org/all/sashiko-outbox-194253@kernel.org/

In short, the CONFIG_TYPEC problem is real and is fixed in v2. The
replug order is also a real gap, and v2 switches back from the mux
callback. The in-place D/F and missing safe state cases follow the
PHY, which also keeps DP-only mode while DisplayPort is powered. This
patch itself is unchanged in v2.

> [Severity: Medium]
[...]
> Without mode-switch on usb_dp_qmpphy, fwnode_typec_mux_get() in
> drivers/usb/typec/mux.c will not match the combo PHY, so the USB controller
> will switch to the UTMI clock on DisplayPort pin assignments C and E while
> usb_dp_qmpphy is never notified of the mode change. Should usb_dp_qmpphy also
> have mode-switch here?

No. Balaji Kalkonda's Kaanapali DisplayPort series adds mode-switch to
usb_dp_qmpphy (patch 3 of v3):
https://lore.kernel.org/all/20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com/

The cover letter lists it as [1]. Adding the property here as well
would conflict with that patch. v2 notes the dependency below the
"---" line of this patch too.

v2: https://lore.kernel.org/all/20261103135057.1682-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
