Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794772961;
	b=mnlhc8lpwWF0eWejJRMBUJU0lUBi+AITZ9CVGH/A5TyKZRW4a7gZOHBTCFA4zjrmjQZI
	 gKnyTZpzBWoYJV7SGKW5/8tyIWIqWMqi8ZGt+ITqePFUa4jlxoGCq1xi/2CP87Pd8bU/u
	 jZBjhZdCBfQXxD/GSNnSacfdYYQnfouozKlTKWWYgzQxH2BgTADiEWiKU9uPTD1NFv7oY
	 KUbMsInobp8Ose034/u7ZIMUCC6K0Z+7ca8Zl34JF/wEyvcC/Yyjp6OMyiVG5a8+I5X04
	 GaaTJmLSimzBnkplWDW6ZIxS0grLLeWBRkYbcXjr7E5nlFJa7PHNW/JKkkjWy6w1RWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794772961;
	h=Received:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:
	 From:To:Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/MMBOiQw6l6mDYjl/NVChHGJRH3wA/AsBJBi6MIn/nI=;
	b=cCWYbyyLmdoCmMIYBcNQrP6jKlO2xRhfW+Osf0A6gRTrU1wizRFj9DpQqprubejpQjNM
	 tVC58Cnqvn8hRlNwCB13P+gvHwwrmE4v+rnss7IaCviMDji9JaJHRpTr5LJN8jpwrx+gc
	 YEucSgCZK/FLSyMUHd3rcI/pXT42wqxrg5yECtLGoT7VsgUOgl3NaGt4kAd9ewdB94WIW
	 Ah3nWIM56aBqTEuqIfyNi8JaDZPc1dBWRA4cz4gKmMT45CiERLpw83g9auuTYdYRYCY6H
	 CT4nT/Kdkl2QlDlDIXceCAbaT24yt70Ae1OvN4PvH2yO9IoNAZQ5Pcyk+w6gIP3nOUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5130E606A335;
	Sun, 15 Nov 2026 20:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 651CE1F000C4;
	Sun, 15 Nov 2026 20:02:38 +0000 (UTC)
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
Subject: Re: [PATCH v4 2/3] phy: cix: Add Sky1 DP PHY driver
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Luo Liu <Luo.Liu@cixtech.com>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
 vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <sashiko-outbox-192860@kernel.org>
References: <20261102030425.1957585-1-Luo.Liu@cixtech.com>
 <20261102030425.1957585-3-Luo.Liu@cixtech.com>
 <sashiko-outbox-192860@kernel.org>
Date: Sun, 15 Nov 2026 12:02:35 -0800
Message-Id: <179477295532.135135.3835475209766065939.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=261;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=/MMBOiQw6l6mDYjl/NVChHGJRH3wA/AsBJBi6MIn/nI=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq+g/dzI6TCUXwkOS4gQPpUvsvWnviIXO6VBbOP
 +vk0WbFNg6JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCavoP3QAKCRBVnxHm/pHO
 9RyMB/wOQ7nLJIyuKkkwbCNioj33q2hrjNfwq9Kc7YyuXLXzep0kLVUeLkko+Ot6xQmGA6uiY4z
 4LH1QLd+D6HURN/2Ith4fa0Ms7kfrobRn6mykL+3I5r9kBY4q5JrzXldIZqww+6LzPoPthgBnpz
 mLy3t5v3vNng3XA/BiQcoNoDSBCwxkPW9Fwc+2ZFmjUmM4DW+dajUGo0o18KAKlN6fqKPca/dBf
 LEtc+fJL1u8xJjHhpDTrtGTVOuaq2mLW0JZQOODTOD7P5JNTjSOzZ9rOzBHpuj6uA4v55YJBkhh
 yQE9CGj+SrTkE4px0wFMX7LoIzsPYl/t/5+bGF/rLfpEifuh
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-02 03:23 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] phy: cix: incomplete hardware reset and state desync in cix_dp_reset()

Looks valid.

- Mani

