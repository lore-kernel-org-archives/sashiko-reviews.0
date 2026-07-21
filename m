Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B30429822
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 18:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784659042; cv=none; b=QkJ4uMt9cGeDtIqn4MapEFFqizUw3SvRTGdGR21bMHHyPf6sLwBUromhF2HIRIM3dai2hGvVDUbbISJECZQnHvYeLMRPqCNV2wTa0sBRDW7XHm5+FyHA9rMA0fYsFYPnyYFEzd03YygDG7vSl3ti67CJ/E9aXA9yxdSeH0Conyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784659042; c=relaxed/simple;
	bh=LnpI7omOEC6ed3yh4sMYyXUnlgF+nBTRExdP6+eDN24=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XZQNbmNpdu1Zda3hcriaeNbfoq4k5WYxrlQEjTAItuZ3Gpsi7wQdmcMgJByZBMN5KCpctKGoQn1LhOziDdYuou/bFk9760BmVtbUKMTWSDd8qCyNp6/SLkj+PiyuusO8ZBaMg2S+6YOA8qPdm7c5KnIzzVXcIK6uibD5h9KNLOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VkCGgycx; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VkCGgycx"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso33090505e9.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 11:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784659039; x=1785263839; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Zpdvr4EUuwpLXzsAE7Bu6HGFDWU6M1piUgIe2pUnOU=;
        b=VkCGgycxMN7gBxxNZUAqjCIqlO36MfKHrI6muXOQFjAITZ3QBTQMauMWZROkwQwpqQ
         jygRUPlAt7riNsQhF3fzAM+pm8mVp2jJ1WRfSuou7xH8kj3s0SPozYPoAoltUpZRLrE7
         43RDdWz2JMevaqi07cKspreY6YWeUZ/f3qyZecS7Lc94ZNJ2I/+h7vNSZSiv9r+xr/sz
         0RedsnVFNjfGaHimrikB76SDrgtDd9UrladnC0wPmsyK5gUVRgorzhGryQycM2rhmNR4
         mOUPVzDOE6j4RDhQPSgVFSRoUDhrhOkbzZ/GqjjWCaYhBfIoA+n8ezgWnL5vFAvkTXtA
         Fa7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784659039; x=1785263839;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Zpdvr4EUuwpLXzsAE7Bu6HGFDWU6M1piUgIe2pUnOU=;
        b=U9QtRrT2i4QpmHOGHVldOUFVU2G3KGOCp5xiVphHhxsVq2jp3+NabjH20dWmDvcSYJ
         IsTvGWvowijvYjuHVa0qX51Hnq3e6pFfImc1lpdKF3UpJcywz05hER7rOYRJkYMULcGD
         oMYY7g5/WDqjAxDOzX51FOkkZkjHbhRUPulNLFjqRTVLuGuHJO+7EwrlVqO0mAr1u7UZ
         mnTpt8J9Knh1rkebwfXd6y68rYKt5p12qoDO3agPmN/rnlbNA4AZwoYkCFWnEZalixGA
         yYifgkGoYFs/2k0c2cu1m9oIvkjZuriAOxpvblrxAAMN+fyz/wAOSF4k7RnBi4FtgyZz
         EhOg==
X-Gm-Message-State: AOJu0YwmTSgqdGIh3j5Td4QTyU4D+EHSbVP4DkRJpOUHjHCd6fX9+z2T
	XF+0wI5/VhkHbpLmG1W4PIAq1sOGfwHTHYcP+b5nN74E67TV60Gl2uyy
X-Gm-Gg: AfdE7cnc84XBqObRd5e4eUnzNYwzguduJEo78FixZ66Ubz2/s+2NJgAoE8AzpUkxyNo
	377DPCapc6cbwHnTic+kzz3jOjtJCXnjJQSzCqj+IjKKQHZX4TBl1+8UsG5lbNLQgBX8KaspdI0
	1WOIsM8B3tDuLfJRehQHVtVi6B9dKhGu3SVrmwABsFzWYx34qtu8PoDjuaAV7TCw7ZV2p8fCH3d
	qe7yLQKiaV8gxEJngFNhk2Wvw0/YXTKicatjssKle3yLXpnJQ69BiE0YhHCEf2aZ6S1EAgKMRSt
	TX6YYFr5RvM+TFnpf76fELVESrGRSIV7T2+udgfEmqGtbz1CXo/hmqURp/wiwDRogi0SAqapzYx
	B0q4zOmOPCL+3Lq87+cQ5JYRAKYsg1RTdWKvqfZuukrMHVp1S7taV6Hhnwz5SYlTeV0e8uE0zls
	0DDmD2mSvhDSnHll13kOU3lpDbzlsJxKFNQIupHOKw5fqylC7pr7hMEGJAaNVJBohOhXH9BfNNj
	lcLKR+c3oE83jClCxHIcKmpyjvkA3tDS4+foqZNTZPR46Ndtll9W5FtcvCdZqZQWxgCbIc6cyS+
	RRrzlO0jkxD4zPEdBN6s443MLUWFcrJ7w2w/U3hBnMAPuV7OMVivnSgVya9HlTq39dhrU97wvuS
	AMFk/t+Mdp68=
X-Received: by 2002:a05:600c:3b88:b0:495:4d2d:82f2 with SMTP id 5b1f17b1804b1-4954d2d8335mr224381425e9.26.1784659039580;
        Tue, 21 Jul 2026 11:37:19 -0700 (PDT)
Received: from systembl0wer (ip-86-49-244-181.bb.vodafone.cz. [86.49.244.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653698bcsm79422215e9.2.2026.07.21.11.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:37:19 -0700 (PDT)
Date: Tue, 21 Jul 2026 20:37:16 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: iio: dac: add support for mcp47a1
Message-ID: <20260721203716.0fc5313c@systembl0wer>
In-Reply-To: <20260721183358.67E151F00A3D@smtp.kernel.org>
References: <20260721-mcp47a1-add-support-v1-0-da045a2567e3@gmail.com>
	<20260721-mcp47a1-add-support-v1-1-da045a2567e3@gmail.com>
	<20260721183358.67E151F00A3D@smtp.kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 21 Jul 2026 18:33:58 +0000
sashiko-bot@kernel.org wrote:

Clarifying Sashiko's comment:

> [Severity: Medium]
> Does the MCP47A1 actually have a dedicated VREF pin? Standard Microchip I2C
> DACs in this class (such as the 6-pin MCP4725) typically use VDD as their
> voltage reference.
> 
> If there is no physical VREF pin on this hardware, requiring vref-supply
> here forces device tree authors to define dummy regulators in their
> device trees just to pass schema validation.

Yes, the MCP47A1 does have a physical VREF pin, as seen in the block diagram:
https://ww1.microchip.com/downloads/aemDocuments/documents/OTH/ProductDocuments/DataSheets/25154A.pdf

-- 
Kind regards,
Joshua Crofts
