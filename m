Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A213137D124
	for <sashiko-reviews@lists.linux.dev>; Fri, 26 Jun 2026 21:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782510112; cv=pass; b=YA3bHF0vaCyROIa4zM9tN5E5oPFB9uOVAS7S4aZmAehtaXEQCD9LuEaH7+1SxUbOzoqiPgiRiefQgLtIea0GzfTYdfN2G6imX9rjeHbmCfbHXhrMv+hwsyhXisjHMwo1f+g5m2muEguXDMO4HYR0OkxjBwdwdotRExVfp9ITMuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782510112; c=relaxed/simple;
	bh=x7PB+0Ueeud2XUqGwdJkK6s91VXJCVlyy1dN5TWJ7sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bMQrRy8lefdSrH3lNHmio01+dkYlKHiJaC9DFMftxmGpTWq6xBVRJUFGEeBJhkw/OiY46TGuxzebJFCTXSNY8y44j5IAxhG8PzFtb6Q4sm5UnXko+N8pLCcmCPnde63hQbVK+E55F7QWU09WJyL5tc+6NIYyLzy5Ow4ewXlICVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YVpU8kNA; arc=pass smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YVpU8kNA"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e6da33a561so966776a34.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 26 Jun 2026 14:41:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782510110; cv=none;
        d=google.com; s=arc-20260327;
        b=sgM94u5beEumUCTPlZK+g+n8wr7N3RWVmX1Qi4lPHLoqTKZLFnw1unksAb8pHiQT3P
         2Nrgp/udfYuu6ibrs9WwIT4/gPBy2CKBOEQAiYMOB6rNeiX61RVDj4xBxQIhfFaPMzNd
         8X3mVGmYHQQMVpb2iC86ANeIlhplKD9O3JFTpOx2p6jJP9yKgLo7nO43HhLJDTR2lE2y
         u3UH3QzqlrRYApYjPsiB2PywlxMD8TaqWeERflCoksdrjOrhagShQw8PMh/YYNj/duUc
         yYdSFFvA4FSx53eNyZqjFllw6Uh0JeDG5oaEG9u9ur6SbAzXKS4oi9lhSxBbv+OsMPm3
         XqHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x7PB+0Ueeud2XUqGwdJkK6s91VXJCVlyy1dN5TWJ7sg=;
        fh=Q2rYdReUlGYpO8A5KWTDDfBRNpKyngq7WO0if3UVjy4=;
        b=h4n1hkD3YGoycjlHcP1CD19s+K1Un8hQbVGtEgtpoDwQbUf4MqnbxvUHfn9grmmU1T
         mY6/s1mzV53ZPWdsdmsap/KQ7J5n0rJtgVcFy10+V0BZ9oVLc7VR2NyQQI13e1AvADwX
         LG/1nNwOQcm+wwEC4yScPmAhutZ3Ta1pJxgj/szTAd/DfYgTT9Zg5w4IBrC2wNjKr4ls
         9J/YTI/8xcO/+YrbgdIpTjiz/TiG83c6jPBK202wqGfm/8vBAq67vfPKA5bJLuCYz5Kq
         cimvXjbqlRC1eHsHzzU9yjNLkZBTl1qdGAS1UAzgTO8ygKzAVArSovZPhiP1qIWbEg+d
         +Cqw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782510110; x=1783114910; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x7PB+0Ueeud2XUqGwdJkK6s91VXJCVlyy1dN5TWJ7sg=;
        b=YVpU8kNAyay2vV/OcvDPQmHQFtl+9Bd6iHImshqEPMCJxaEQVdZZQO6m9yoZi0PjW8
         7T0JWYkUPfONXzJrySHPqAasd9192QK0I65YxNg8dFi5R8ku0Mhtkwbl1Jv25f3K4/ID
         FKbP1WV9zYNGnUpcsRLzb0U2DxgZFU4g5KEQziuR5xWb2HHAOxfA+NlWCcwFEoVnptp3
         jUdk5BE2UrdsO1vRBUupCics1hRDknED12RRImKVuKPB70wsGH8K/dEralMvk711cRgt
         Zpbdsiu2LngtfI/PcWhYL9nlWtpwzK+hEDmV07bQr0F7MWtwvHNErP9WXA3iuNxB9hfC
         9IZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782510110; x=1783114910;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x7PB+0Ueeud2XUqGwdJkK6s91VXJCVlyy1dN5TWJ7sg=;
        b=Cj3YVQMRu5QWfi02OPuCGWjHb9mXvNofLrV+IJ+rwRvj3EiSPMKmTYTPic7Z3bx+gd
         ZaDyt8mJ8UoPnaNzLfgTi9214ztytVFUaFKKhWnaiZGODYQXkmMoslesy7rI+wQeQTPF
         8Pemhy0yQH51rT3wKK20FwW/sR2HW2aaaDpRf+AwzhUsJwWiLoybKMIkxTYK+mNujo2y
         WKDUmVxkze4cE1hAGS7CJSNnMgs1aeZvLQUkoXKqg7X+9VxVfm6kBvdYA+bxSiBjAbbf
         UzNV68s7FV4wt5zVIp+/jC4LF40k1MRSDvi2QbapCh2AnMYeCJKP6VDteInwOQgpCdoF
         ykfg==
X-Gm-Message-State: AOJu0YwkUhcSeuLdB3MO5lVgQMT1emUfvpSKo4Fd2lr+J7TzXeuZRtLy
	s4z09Udhfn5fIx4G2Giu+4zzwWNXcjMGTX3ENIJXm6MaDGVS+bDwy2S3YiXJrESUQ6W2cnpSOHS
	3KEpQANhX+cEQyHtGaIbfBJxuW+EvEoqayuWmlevn4njc/YMoZYq09+ND9MA=
X-Gm-Gg: AfdE7cmYk5I51UYisWbnlDY7x79L6OR9oxBfeZJGs23TfPHVgZDwJJwZ8ya4Q+2bgk6
	MbUrBanVk6y5KSqy0fVtS786vX44wxn8vHs8bVL/zOSl9AA1vs5exiXNtqRZnKPWyBjtivLyhbB
	KJFckPa6/d3DBjnl944zBdWHv5EUO99ZOqhZ7t/YYtQpbMqyKThn5oZ9aWTF0L+6EB2TpUgNsev
	J9uil0VTnVYGqpPKbBNde2Mou29BK5tnJj/aDH1bq+LX/TPiuJjc9g+mE4makGrZ4V1oEm/pBuq
	bBwSDX35CQoeWJMnfQfRlOqe
X-Received: by 2002:a05:6808:5092:b0:493:b22c:9fb4 with SMTP id
 5614622812f47-493b22ca525mr2850504b6e.6.1782510110141; Fri, 26 Jun 2026
 14:41:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260622175240.2469937-2-rdbabiera@google.com> <20260622180542.4108F1F000E9@smtp.kernel.org>
In-Reply-To: <20260622180542.4108F1F000E9@smtp.kernel.org>
From: RD Babiera <rdbabiera@google.com>
Date: Fri, 26 Jun 2026 14:41:39 -0700
X-Gm-Features: AVVi8CcBZcAcce4t_Wky9bz5ABzcI-X4PWP4fhnPGIDoicCEsJdYHcJCDjh6NO8
Message-ID: <CALzBnUFomBMRANaYEO_eri3hW4N74wSLjEqiBneatLGgu2wckw@mail.gmail.com>
Subject: Re: [PATCH v2] phy: Add USB3 PHY support to Google Tensor SoC USB PHY driver
To: sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, neil.armstrong@linaro.org, 
	olteanv@gmail.com, vkoul@kernel.org, 
	Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 11:05=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
> [Severity: High]
> Will this error path leak the reference clock request?
>
> Since set_pmgt_ref_clk_req_n(gphy, true) was called earlier, if
> clk_bulk_prepare_enable() fails we return without deasserting the clock
> request.
>
> The driver core doesn't invoke phy_exit() if phy_init() fails, so the
> request will remain permanently asserted.
>
> [Severity: High]
> Does this error path also leak the reference clock request?
>
> It properly unwinds the clocks and resets, but it misses calling
> set_pmgt_ref_clk_req_n(gphy, false) before returning.

I addressed this in V1 where a phy_init failure would likely result
in the hardware powering off and on again and the request would
clear, but I'll change it for the next version for correctness.

> [Severity: High]
> If program_tca_locked() fails, will hardware programming retries fail
> because the software state was prematurely updated?
>
> If the USB subsystem retries powering on the PHY after an error, the earl=
y
> success check at the top of google_usb3_phy_power_on() will hit and retur=
n 0
> without actually re-attempting the hardware configuration.

I'll change this so that COMBO_PHY_TCA_READY is set when the initial
PoR =3D> NC check passes, but subsequent power_on calls skip waiting
for the PoR =3D> NC request and allow the program_tca_locked() call
to be made while the internal PHY state is COMBO_PHY_TCA_READY.

> [Severity: High]
> Is the missing .power_off callback going to cause the state machine to
> desync on suspend and resume?
>
> During suspend, without a power off hook, gphy->phy_state remains
> COMBO_PHY_TCA_READY. On resume, google_usb3_phy_power_on() checks this
> state and returns 0 without reprogramming the TCA hardware, which could
> permanently break the link.

The change above should cover this case.

> [Severity: Critical]
> Will unconditionally requesting the usb3 clocks break backwards compatibi=
lity
> on systems using older device trees?
>
> If an older device tree only provides USB2 resources, devm_clk_bulk_get()
> will fail here and abort the entire probe sequence.
>
> [Severity: Critical]
> Similarly, will unconditionally requiring the usb3_tca resource break pro=
be
> for older device trees that only define USB2 resources?
>
> If the memory region is missing from the DT, this will return an error an=
d
> prevent the USB2 PHY from working on those devices.

The PHY IP supports the USB3 resources by default, so it makes sense
to bake in the requirements.

Best,
RD
