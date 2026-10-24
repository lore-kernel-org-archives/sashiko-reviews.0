Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=218.76.62.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792837142;
	b=sceYdHpk5xalhSuexgm+4Fc1DwI/RwkEKyW8u4P96Z0kFse2I7dME7zRdA9/kgTI/Vl7
	 maRKO224ybI5k5LriiDnX0mY9Z9INif6MWZaB3IFiBSe1jz9Jx5MDrZHRrzbW+LWLQB7w
	 wFZrikrjdu/t6i40mAD5iBfKfruoSU0sa4PmEVCOJ2L/M+9hz45ojvvdcqoM2nlass3Qk
	 Stby6D9a2OCathyiPqx1G82p2wG6pElu8aOGD0y8h8uLb39pmRdB5tf7BO/waVqy8d3Rb
	 92DWmDiYxse8r1cRVBNG8s4kIQG/MRX9iPD1yd6lR7eis82fjCTUYB042/juXjNqx3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792837142;
	h=DMARC-Filter:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=mhr9qgQE0EJPZKLcMiOOrsxk2svu6ZzTrQM8BT1dCJc=;
	b=ddDCgzxPvI6j6jyiB16G8D/uJItrnTmYifb1KyD0t7KHo3i03kqQzCsaYVX4OLXsftwX
	 zequyBgn1ZnHP/lE+icmCL37mWlcXTUGdPduCXtJAYotWyzd3HpojtunhSRUKK1LDbn/z
	 /qEffJXEJlsTGPKsgLGWQEIFlSzu3eHD9I74D2l8Gwi8RxVC/M0eTOHkXgluZtOpT2mdC
	 JpvvhRaZAQo2oKhl8stH2uZFNDuHM6U6Wx8FjUO6brBCvpaRSkvsXlMNVXHYbqtLGMH2c
	 wCMh9Ceyip0oUy19omBkmr8yaaNVkV8CbEy1Fo+A1CeEMZz+9JIHX2GMBN+sweHqK9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ultrarisc.com;
	spf=pass smtp.mailfrom=ultrarisc.com;
	dkim=pass header.d=ultrarisc.com header.i=@ultrarisc.com header.a=rsa-sha256 header.s=dkim header.b=GRuZkjY5;
	arc=none smtp.remote-ip=218.76.62.146
Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C28E606A31A
	for <sashiko-reviews@lists.linux.dev>; Sat, 24 Oct 2026 10:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C28E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ultrarisc.com header.i=@ultrarisc.com header.a=rsa-sha256 header.s=dkim header.b=GRuZkjY5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=mhr9qgQE0EJPZKLcMiOOrsxk2svu6ZzTr
	QM8BT1dCJc=; b=GRuZkjY54UQOdhvq+HKxgcbh1/Of2eUSAgruFfFKI2RC7k1KX
	K33vGdyftDFkIq6Na7CcyFo3Ai2nJ2XRv0FEWKwiBgeKgQXCoy2SyTSmHtkDmH8T
	DCWTnMh4erjSfRZxZtTQQeeSH6MKUOqjUiXQPgTOZC7Y2N8IKcFljoIwdI=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwCnYwX9hdxqkrMCAA--.881S2;
	Sat, 24 Oct 2026 18:18:49 +0800 (CST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 5/7] riscv: dts: ultrarisc: Add initial device tree
 for UltraRISC DP1000
From: Xincheng Ji <jixincheng@ultrarisc.com>
To: sashiko-reviews@lists.linux.dev
Cc: Xincheng Ji <jixincheng@ultrarisc.com>, devicetree@vger.kernel.org, 
 robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <sashiko-outbox-183627@kernel.org>
References: <20261024-ultrarisc-dts-v6-0-c62994d8a114@ultrarisc.com>
 <20261024-ultrarisc-dts-v6-5-c62994d8a114@ultrarisc.com>
 <sashiko-outbox-183627@kernel.org>
Date: Sat, 24 Oct 2026 18:18:38 +0800
Message-Id: <179283711841.2737981.7618602420031907655.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792837118; l=893;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=L946K+8csVVFcJRZMouriLB15lZ6UCCrxKjDXCdTcrE=;
 b=aUiU6l6gLNmzjFU2VEY2F89m6bh9b253J2I1VbEzX2lkDDXMbu7cvpQ/WJ8JkkJncic125ca+
 49aLkbY55aMAlwL/ltz5cxXNx2WW4DOwU2Qrcm2RwZwraqqPa9f9cR/
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-CM-TRANSID:AQAAfwCnYwX9hdxqkrMCAA--.881S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gr45AFWfKFyDWr4UuryfZwb_yoWfXFcEgF
	WIyasrCw4DGrs5GanIkrs0qr1Fyr4xGF18Jr1YkrnxtrW5JFsrJFW8tr1SvFyIq3y7tF90
	9ryfWanrKr1IgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbI8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Jr0_Gr
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_
	Jw1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
	0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
	AVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
	CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
	wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj
	fUehL0UUUUU
X-CM-SenderInfo: pml0x0xfkh0wg6xo325dul2uoofrz/1tbiAQAHDmrYYSwADQAgsa

On 2026-10-24 09:43 +0000, sashiko-bot@kernel.org wrote:
> The duplicated @9000000 suffix causes dtc to fail compilation in
> scripts/dtc/checks.c:check_node_name_format() when building any board
> device tree that includes dp1000.dtsi:
> 
>     if (strchr(get_unitname(node), '@'))
>         FAIL(c, dti, node, "multiple '@' characters in node name");
> 
> It also causes check_simple_bus_reg() and dtbs_check validation to fail
> because the unit-address does not match the reg property address.
> 
Thanks for catching these mistakes, and sorry for the careless errors.

I've fixed the PLIC node name and moved the M0 PHY node rename into
the M0 board patch for v7. Both board DTBs now compile successfully.

I'll review the changes and validate each patch more carefully before
sending future revisions.

Thanks,
Xincheng

-- 
Xincheng Ji <jixincheng@ultrarisc.com>

